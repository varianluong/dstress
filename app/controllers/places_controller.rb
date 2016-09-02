require 'json'
require 'net/http'
require 'open-uri'
class PlacesController < ApplicationController
	def index
		if not logged_in?
			return redirect_to '/sessions/new'
		end
		user = User.find(session[:user_id])
		zipcode = user.location
		if not zipcode
			return redirect_to '/'
		end
		@url = "https://www.google.com/maps/embed/v1/search?key=#{Figaro.env.GOOGLE_API_KEY}&q=#{zipcode}"
	end

	def geturl
		user = User.find(session[:user_id])
		zipcode = user.location

		url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{params[:place]}+near+#{zipcode}&key=#{Figaro.env.GOOGLE_API_KEY}"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request)
		data = response.body
		datajson = JSON.load(data)

		# render json: datajson

		results = []
		datajson["results"].each do |location|
			location_obj = {:name => location["name"], :address => location["formatted_address"]}
			results.append(location_obj)
		end

		obj = {:status => 'success' ,:url => "https://www.google.com/maps/embed/v1/search?key=#{Figaro.env.GOOGLE_API_KEY}&q=#{params[:place]}+near+#{zipcode}", :results => results}
		render json: obj
		# render text: ENV['GOOGLE_MAPS_EMBED_API_KEY']
	end
end

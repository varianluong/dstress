require 'json'
require 'net/http'
require 'open-uri'
class ArticlesController < ApplicationController
	def index
		if not logged_in?
			return redirect_to '/sessions/new'
		end
		# puts session[:stress_reason]
		if not session[:stress_reason]
			return redirect_to '/'
		end
	end

	def get_results
		stress_reason = Reason.find(session[:stress_reason]).stress_reason
		if params[:query]
			query = params[:query]
		else
			query = "articles+about+#{stress_reason}+stress"
		end
		url = "https://www.googleapis.com/customsearch/v1?key=#{Figaro.env.GOOGLE_API_KEY}&cx=#{Figaro.env.GOOGLE_CUSTOM_SEARCH_CX}&q=#{query}&fields=items"
		# url = "https://cse.google.com/cse/publicurl?cx=#{Figaro.env.GOOGLE_CUSTOM_SEARCH_CX}"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request)
		data = response.body
		items = JSON.load(data)
		# @results = items['items']
		obj = {:results => items['items']}
		render json: obj
	end
end

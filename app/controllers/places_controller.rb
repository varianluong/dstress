require 'json'
require 'net/http'
require 'open-uri'
class PlacesController < ApplicationController
	def index
		# @user = User.find(session[:id])
		# zipcode = @user.location
	end

	def geturl
		# @user = User.find(session[:id])
		# uri = URI.parse("https://www.google.com/maps/embed/v1/search?key=#{ENV['GOOGLE_MAPS_EMBED_API_KEY']}&q=#{params[:place]}+near+94539")
		# http = Net::HTTP.new(uri.host, uri.port)
		# http.use_ssl = true
		# http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		# request = Net::
		user = User.find(session[:user_id])
		zipcode = user.location
		obj = {:status => 'success' ,:url => "https://www.google.com/maps/embed/v1/search?key=#{Figaro.env.GOOGLE_MAPS_EMBED_API_KEY}&q=#{params[:place]}+near+#{zipcode}"}
		render json: obj
		# render text: ENV['GOOGLE_MAPS_EMBED_API_KEY']
	end
end

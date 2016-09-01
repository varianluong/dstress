require 'json'
require 'net/http'
require 'open-uri'
class ArticlesController < ApplicationController
	def index
		url = "https://www.googleapis.com/customsearch/v1?key=#{Figaro.env.GOOGLE_API_KEY}&cx=#{Figaro.env.GOOGLE_CUSTOM_SEARCH_CX}&q=articles+about+stress&fields=items"
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request)
		data = response.body
		items = JSON.load(data)
		@results = items['items']
	end
end

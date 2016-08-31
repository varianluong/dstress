class ArticlesController < ApplicationController
	def index
		url = "https://www.googleapis.com/customsearch/v1?key=#{Figaro.env.GOOGLE_API_KEY}&cx=017576662512468239146:omuauf_lfve&q=lectures"
	end
end

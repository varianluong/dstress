class GamesController < ApplicationController
  def index
  	user = User.find(session[:user_id]) 
  	Image.first.destroy if (Image.first != Image.last) 
  	image = Image.last
  	#@image.update(user_id: session[:user_id])
  	if (image === nil)
  		@imgurl = "/assets/the-trump.jpg"
  	else
  		@imgurl = image.dartboard.url
  	end
  end
end

class ImagesController < ApplicationController
    def index
    end

    def new
    end

    def create
        @image = Image.new(image_params)
        #@image.update(user_id: session[:user_id])
        # warn "\n\n\n\n\n\n"
        # warn @image.inspect
        # warn "\n\n\n\n\n\n"
            
        if @image.save
            redirect_to '/games/index'
        else
            redirect_to '/games/index'
        end
    end

    private #############
    def image_params
        params.require(:image).permit(:dartboard)
    end
end

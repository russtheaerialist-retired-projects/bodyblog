class BodyPhotosController < ApplicationController
    def new
        @body_photo = BodyPhoto.new(params[:body_photo])
    end

    def index
        @body_photos = BodyPhoto.find_all_by_public(nil)
    end

    def create 
        @body_photo = BodyPhoto.new(params[:body_photo])
        if (@body_photo.save)
            redirect_to body_photo_url(@body_photo)
        else
            flash[:notice] = 'Your photo is invalid'
            render :action => new
        end
    end

    def show
        @body_photo = BodyPhoto.find(params[:id])
 
        respond_to do |format|
          format.html # show.html.erb
          format.jpg # show.jpg.flexi
          format.png # show.jpg.flexi
          format.xml { render :xml => @photo_file }
        end
    end
end

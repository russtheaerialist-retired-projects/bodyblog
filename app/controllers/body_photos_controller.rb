class BodyPhotosController < ApplicationController
    before_filter :require_user, :only => [ :new, :create ]

    def new
        @body_photo = BodyPhoto.new(params[:body_photo])
        @params = params
        if (params[:blog_id])
            @body_photo.blog_id = params[:blog_id]
        end
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
            render :action => 'new'
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

    def calendar
        show
    end

    def thumbnail
        show
    end

    def calendar_highlight
        show
    end
end

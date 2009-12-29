class PhotoTypesController < ApplicationController
    def index
        @photo_types = PhotoType.find(:all)
 
        respond_to do |format|
          format.html # show.html.erb
          format.xml { render :xml => @photo_types }
        end
    end
end

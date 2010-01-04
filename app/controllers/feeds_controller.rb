class FeedsController < ApplicationController
    def index
        @blogs = Blog.find(:all, :order=>"created_at", :limit=>10)
        respond_to do |format|
            format.html
            format.json
            format.rss
            format.atom
        end
    end
end

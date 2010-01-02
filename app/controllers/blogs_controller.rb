class BlogsController < ApplicationController
    before_filter :require_user, :only => [ :new, :create ]
    
    def index
        redirect_to root_path
    end

    def show
        @blog = Blog.find(params[:id])
        @public_photos = BodyPhoto.find_displayable_for_blog(@blog)
    end

    def edit
        @blog = Blog.find(params[:id])
    end

    def new
        @blog = Blog.new(params[:blog])
    end

    def update
        @blog = Blog.update(params[:id], params[:blog])
        if (@blog.valid?)
            flash[:notice] = 'Successfully Updated Post'
            redirect_to blog_url(@blog)
        else
            flash[:notice] = 'Your Post was not saved'
            render :action=>'edit'
        end
         
    end

    def create
        @blog = Blog.new(params[:blog])
        if (@blog.save)
            flash[:notice] = 'Successfully Saved new Post'
            redirect_to blog_url(@blog)
        else
            flash[:notice] = 'Your Post was not saved'
            render :action=>'new'
        end
    end
end

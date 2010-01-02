class CalendarController < ApplicationController
    def index
        redirect_to archive_url(:year=>Time.now.year,
                                :month=>Time.now.month)
    end

    def year
        @posts = Blog.posts_for_year(params[:year])
        @year = params[:year]
    end

    def show
        @year = Integer(params[:year])
        @month = Integer(params[:month])
        @posts = Blog.posts_for_month_by_date(@year, @month)
    end
end

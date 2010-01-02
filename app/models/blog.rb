class Blog < ActiveRecord::Base
    has_many :body_photos
    validates_presence_of :body

    def self.posts_for_month_by_date(year, month)
        retval = { }
        Blog.all(:group=>"date(created_at)", :order=>"created_at").each do |blog|
            retval[blog.created_at.mday] = blog
        end
        retval
    end

    def self.posts_for_year(year)
        retval = { }
        Blog.all(:group=>"date(created_at)", :order=>"created_at").each do |blog|
            if (!retval.has_key?(blog.created_at.month))
                retval[blog.created_at.month] = [ ]
            end
            retval[blog.created_at.month] << blog
        end

        retval
    end

    def contains_stats?
        weight or waist or chest or hips or bodyfat or calories_burned or calories_eaten or hours_slept
    end
end

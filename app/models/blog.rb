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

    def title
        created_at.mday.to_s + " " + Date::MONTHNAMES[created_at.month] + " " + created_at.year.to_s
    end

    def contains_stats?
        contains_body_composition? or contains_measurements? or contains_energy? or contains_special?
    end

    def contains_body_composition?
        weight.present? or bodyfat.present?
    end

    def contains_measurements?
        waist.present? or chest.present? or hips.present?
    end

    def contains_energy?
        calories_burned.present? or calories_eaten.present? or hours_slept.present?
    end

    def contains_special?
        ate_primal or shaved or exercised
    end

    def self.last_n_sleep_entries(count)
        Blog.find(:all, :conditions=>["hours_slept > 0"], :order=>"created_at", :limit=>count).map do |blog|
            Float(blog.hours_slept)
        end
    end

    def self.last_n_calories_eaten_entries(count)
        Blog.find(:all, :conditions=>["calories_eaten > 0"], :order=>"created_at", :limit=>count).map do |blog|
            Integer(blog.calories_eaten)
        end
    end

    def self.last_n_calories_burned_entries(count)
        Blog.find(:all, :conditions=>["calories_burned > 0"], :order=>"created_at", :limit=>count).map do |blog|
            Integer(blog.calories_burned)
        end
    end

    def self.last_n_calories_difference_entries(count)
        Blog.find(:all, :conditions=>["calories_burned > 0 and calories_eaten > 0"], :order=>"created_at", :limit=>count).map do |blog|
            Integer(blog.calories_eaten) - Integer(blog.calories_burned)
        end
    end

    def self.last_n_waist_entries(count)
        Blog.find(:all, :conditions=>["waist > 0"], :order=>"created_at", :limit=>count).map do |blog|
            Integer(blog.waist)
        end
    end

    def self.last_n_chest_entries(count)
        Blog.find(:all, :conditions=>["chest > 0"], :order=>"created_at", :limit=>count).map do |blog|
            Integer(blog.chest)
        end
    end

    def self.last_n_hips_entries(count)
        Blog.find(:all, :conditions=>["hips > 0"], :order=>"created_at", :limit=>count).map do |blog|
            Integer(blog.hips)
        end
    end

    def self.last_n_weight_entries(count)
        Blog.find(:all, :conditions=>["weight > 0"], :order=>"created_at", :limit=>count).map do |blog|
            Float(blog.weight)
        end
     end

    def self.last_n_bodyfat_entries(count)
        Blog.find(:all, :conditions=>["bodyfat > 0"], :order=>"created_at", :limit=>count).map do |blog|
            Float(blog.bodyfat)
        end
     end

     def self.last_n_primal_entries(count)
        Blog.find(:all, :order=>"created_at", :limit=>count).map do |item|
            if (item.ate_primal)
                1
            else
                -2
            end
        end
     end

     def self.last_n_shaved_entries(count)
        Blog.find(:all, :order=>"created_at", :limit=>count).map do |item|
            if (item.shaved)
                1
            else
                -2
            end
        end
     end

     def self.last_n_exercised_entries(count)
        Blog.find(:all, :order=>"created_at", :limit=>count).map do |item|
            if (item.exercised)
                1
            else
                -2
            end
        end
     end
end

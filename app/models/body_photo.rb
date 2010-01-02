class BodyPhoto < ActiveRecord::Base
    acts_as_fleximage :image_directory=>'body/photos'
    belongs_to :blog
    belongs_to :photo_type
    validates_presence_of :blog

    def self.find_first_displayable_for_blog(blog_or_id)
        if (blog_or_id.kind_of?(ActiveRecord::Base))
            BodyPhoto.find(:first, :conditions=>{ :public=>true, :blog_id=>blog_or_id.id })
        else
            BodyPhoto.find(:first, :conditions=>{ :public=>true, :blog_id=>blog_or_id })
        end
    end

    def self.find_displayable_for_blog(blog_or_id)
        if (blog_or_id.kind_of?(ActiveRecord::Base))
            BodyPhoto.find(:all, :conditions=>{ :public=>true, :blog_id=>blog_or_id.id })
        else
            BodyPhoto.find(:all, :conditions=>{ :public=>true, :blog_id=>blog_or_id })
        end
    end
end

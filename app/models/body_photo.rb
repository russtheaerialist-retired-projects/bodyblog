class BodyPhoto < ActiveRecord::Base
    acts_as_fleximage :image_directory=>'body/photos'
    belongs_to :blog
    belongs_to :photo_type
end

class Gull < ActiveRecord::Base
    belongs_to:user
    has_many:replies
    mount_uploader :image, ImageUploader
end

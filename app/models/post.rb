class Post < ApplicationRecord
  mount_uploader :video, VideoUploader
  
  validates :title, presence: true
end

class Post < ApplicationRecord
  mount_uploader :video, VideoUploader
  process_in_background :video, PostJob
  
  validates :title, presence: true
end

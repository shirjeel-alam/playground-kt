class Post < ApplicationRecord
  mount_uploader :video, VideoUploader
  mount_uploader :video_upload, VideoUploader
  
  validates :title, presence: true

  def video64=(video_data)
    self.video_upload = FilelessIO.new(video_data[0], Base64.decode64(video_data[1]))
  end
end

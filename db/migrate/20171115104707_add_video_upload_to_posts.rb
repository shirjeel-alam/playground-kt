class AddVideoUploadToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :video_upload, :string
  end
end

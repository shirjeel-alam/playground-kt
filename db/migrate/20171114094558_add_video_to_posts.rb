class AddVideoToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :video, :string
  end
end

class RenameIamgeIdColumnToUsers < ActiveRecord::Migration[5.2]
  def change
     rename_column :posts, :iamge_id, :image_id
  end
end

class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :icon_id, true
    change_column_null :users, :introduction, true
    change_column :users, :is_active, :boolean, :default => true
  end
end

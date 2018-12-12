class AddActiveColumnToUserInterests < ActiveRecord::Migration[5.2]
  def change
    add_column :user_interests, :active, :boolean, default: true
  end
end

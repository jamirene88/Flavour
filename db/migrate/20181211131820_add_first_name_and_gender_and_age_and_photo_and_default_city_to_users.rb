class AddFirstNameAndGenderAndAgeAndPhotoAndDefaultCityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :photo, :string
    add_reference :users, :city, foreign_key: true
  end
end

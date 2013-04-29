class AddCityTypeAndPriceToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :city, :string
    add_column :courses, :price, :float
    add_column :courses, :type, :string
  end
end

class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.date :start_date
      t.boolean :available
      t.text :program
      t.text :note

      t.timestamps
    end
  end
end

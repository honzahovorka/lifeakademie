class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.references :course
      t.string :variable_symbol
      t.boolean :paid
      t.datetime :paid_at

      t.timestamps
    end
    add_index :orders, :user_id
    add_index :orders, :course_id
  end
end

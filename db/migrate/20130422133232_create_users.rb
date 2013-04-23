class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :name
      t.string :surname
      t.boolean :email_confirmed, default: false

      t.timestamps
    end
  end
end

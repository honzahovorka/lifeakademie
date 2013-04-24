class AddAdditionalInformationsToUser < ActiveRecord::Migration
  def change
    add_column :users, :street,                   :string
    add_column :users, :city,                     :string
    add_column :users, :postal_code,              :string
    add_column :users, :phone,                    :string
    add_column :users, :date_of_birth,            :date
    add_column :users, :place_of_birth,           :string

    add_column :users, :billing_street,           :string
    add_column :users, :billing_city,             :string
    add_column :users, :billing_postal_code,      :integer

    add_column :users, :company,                  :string
    add_column :users, :ic,                       :string
    add_column :users, :dic,                      :string

    add_column :users, :status,                   :string
    add_column :users, :email_confirmation_hash,  :string
    add_column :users, :password_reset_hash,      :string
    add_column :users, :password_reseted_at,      :datetime
  end
end

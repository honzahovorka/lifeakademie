# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  email                   :string(255)
#  password_hash           :string(255)
#  password_salt           :string(255)
#  name                    :string(255)
#  surname                 :string(255)
#  email_confirmed         :boolean          default(FALSE)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  street                  :string(255)
#  city                    :string(255)
#  postal_code             :string(255)
#  phone                   :string(255)
#  date_of_birth           :date
#  place_of_birth          :string(255)
#  billing_street          :string(255)
#  billing_city            :string(255)
#  billing_postal_code     :integer
#  company                 :string(255)
#  ic                      :string(255)
#  dic                     :string(255)
#  status                  :string(255)
#  email_confirmation_hash :string(255)
#  password_reset_hash     :string(255)
#  password_reseted_at     :datetime
#  role                    :string(255)      default("user")
#

class User < ActiveRecord::Base

  ROLES = %w(host user student editor)

  attr_accessible :email, :name, :password_hash,
    :password_salt, :surname, :password, :password_confirmation, :street, :city,
    :postal_code, :date_of_birth, :place_of_birth, :billing_street, :billing_city,
    :company, :billing_postal_code, :company, :ic, :dic, :course_interest

  attr_accessor :password, :full_name, :course_interest

  before_save :encrypt_password
  before_create :generate_confirmation_hash

  validates_presence_of :email, :name, :surname, :password
  validates_uniqueness_of :email
  validates_confirmation_of :password, :message => "se neshoduje s potvrzením hesla"

  def confirmed?
    email_confirmed
  end

  def is_editor?
    role == 'editor'
  end

  def full_name
    "#{name} #{surname}"
  end

  def remember_me_code
    Digest::SHA1.hexdigest(self.email)[4,28]
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user and user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    end
  end

  def confirm_email!
    self.update_attribute(:email_confirmed, true)
    self.update_attribute(:email_confirmation_hash, nil)
  end

  private

  def generate_confirmation_hash
    self.email_confirmation_hash = SecureRandom.hex(10)
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end

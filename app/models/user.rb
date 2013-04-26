class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_hash, :password_salt, :surname, :password, :password_confirmation, :street, :city, :postal_code, :date_of_birth, :place_of_birth, :billing_street, :billing_city, :company, :billing_postal_code, :company, :ic, :dic

  attr_accessor :password, :full_name, :course_interest

  before_save :encrypt_password

  validates_presence_of :email, :name, :surname, :password
  validates_confirmation_of :password, :message => "se neshoduje s potvrzením hesla"

  def confirmed?
    email_confirmed
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

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end

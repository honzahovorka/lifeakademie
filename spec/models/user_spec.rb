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

require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }
  let(:starlife_user) { FactoryGirl.create(:starlife_user) }

  it { should respond_to :name }

  context "#set_role" do
    it "should set user role to user with email domain other than @starlife.cz and others" do
      user.role.should eq('user')
    end

    it "should set editor role to user with email domain @starlife.cz" do
      starlife_user.role.should eq('editor')
    end
  end

end

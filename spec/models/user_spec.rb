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

  context "#full_name" do
    it 'should use name + surname as fullname' do
      user.full_name.should eq 'John Doe'
    end
  end

  context "#set_role" do
    it "should set user role to user with email domain other than @starlife.cz and others" do
      user.role.should eq('user')
    end
  end

  context "#to_s" do
    it "should fullname as string representation of object" do
      user.to_s.should eq 'John Doe'
    end
  end

end

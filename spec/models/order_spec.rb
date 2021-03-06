# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  course_id       :integer
#  variable_symbol :string(255)
#  paid            :boolean          default(FALSE)
#  paid_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  status          :string(255)
#  price           :float
#

require 'spec_helper'

describe Order do

  subject { FactoryGirl.create(:order) }

  it { should belong_to :user }
  it { should belong_to :course }

  it { should_not be_paid }

  context "#pay!" do
    it "should set paid and paid_at" do
      subject.pay!
      subject.paid.should be_true
      subject.paid_at.should be_within(1.second).of(DateTime.now)
    end
  end

  context "#generate_variable_symbol!" do
    it "should generate the right variable symbol" do
      subject.variable_symbol.should eq('770000001')
    end
  end

  context "#to_s" do
    it "should return variable symbol as string representation of object" do
      subject.to_s.should eq('770000001')
    end
  end

end

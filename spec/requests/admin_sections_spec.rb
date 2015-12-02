require 'spec_helper'

describe "Admin sections" do
  it "should not let in guest user" do
    visit admin_dashboard_path
    page.status_code.should eq 200
    page.should have_content 'Nejprve se musíte přihlásit'
  end

  it "should not let in logged user without editor role" do
    @user = FactoryGirl.create(:user)
    @user.confirm_email!
    @user.save!

    visit admin_dashboard_path

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_button 'Přihlásit'

    page.should have_content 'Uživatel úspěšně přihlášen'

    visit admin_dashboard_path

    page.status_code.should eq 200
    current_path.should == login_path
    page.should have_content 'Nemáte dostatečné oprávnění pro vstup do administrace'
  end

  it "should let in logged editor user" do
    @user = FactoryGirl.create(:starlife_user)
    @user.confirm_email!
    @user.role = 'editor'
    @user.save!

    visit admin_dashboard_path

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_button 'Přihlásit'

    page.should have_content 'Uživatel úspěšně přihlášen'

    visit admin_dashboard_path

    page.status_code.should eq 200
    current_path.should eq admin_dashboard_path
  end
end

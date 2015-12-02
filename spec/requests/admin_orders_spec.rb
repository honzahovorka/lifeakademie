require 'spec_helper'

describe "Admin orders section" do

  before :each do
    @user = FactoryGirl.create :starlife_user
    @user.confirm_email!
    @user.role = 'editor'
    @user.save

    visit login_path

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_button 'Přihlásit'

    visit admin_orders_path
  end

  describe "There is no orders placed" do
    it "should display message that there are no orders" do
      visit admin_orders_path
      within 'table' do
        page.should have_content 'Nejsou žádné objednávky'
      end
    end
  end

  describe "There is a few orders" do
    before :each do
      @order = FactoryGirl.create(:order)
      @order.save
      visit admin_orders_path
    end

    it "should display orders in table" do
      within 'table' do
        page.should_not have_content 'Nejsou žádné objednávky'
        page.should have_content @order.to_s
      end
    end

    describe "there is unpaid order" do
      it "should have one unpaid order" do
        within 'table' do
          page.should have_content 'Čeká na zaplacení'
        end
      end

      it "should have pay link" do
        within 'table' do
          page.should have_content 'Zaplatit'
        end
      end

      it "should be set as paid when pay link is clicked" do
       within 'table' do
         click_link 'Zaplatit'
       end
       page.should_not have_content 'Zaplatit'
       page.should_not have_content 'Čeká na zaplacení'
       page.should have_content DateTime.now.strftime('%d. %m. %Y')
       page.should have_content "Objednávka s VS #{@order.variable_symbol} úspěšně zaplacena"
      end
    end

  end
end

# coding: UTF-8

require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')

feature "User updating" do
  background do
    @user = create_user
  end

  scenario "Edit logged in user with valid data" do
    log_in_as @user

    click_link 'settings'

    find('#user_email')['disabled'].should be == true
    find('#user_password')['disabled'].should be == true
    find('#user_password_confirmation')['disabled'].should be == true

    click_link 'unlock your chain'

    fill_in 'Insert your current password', :with => @user.password
    click_button 'Unlock'

    fill_in 'YOUR EMAIL', :with => 'fuuuuuu@cartodb.com'
    fill_in 'YOUR PASSWORD', :with => 'fuuuuuuuu'
    fill_in 'CONFIRM YOUR PASSWORD', :with => 'fuuuuuuuu'

    click_button 'Save changes'

    page.should have_content('Your data was updated successfully.')

    visit logout_path

    @user.email    = 'fuuuuuu@cartodb.com'
    @user.password = 'fuuuuuuuu'
    log_in_as @user
    current_path.should == dashboard_path
  end

end
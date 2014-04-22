require "test_helper"
feature("
  As a site visitor
  I want to be able to sign in
  so that I can perform actions that require me to be logged in.
") do
  scenario "sign in" do
    # Given a sign in form
    visit new_user_session_path

    # When I sign in with valid info
    fill_in "Email", with: "admin@admin.com"
    fill_in "Password", with: "password"
    click_on "Sign in"
    visit root_path
    # Then I should be signed in
    page.must_have_content "Portfolio"
    page.wont_have_content "There was a problem with your sign in"
  end
  scenario "sign in with twitter works" do
   visit root_path
   #click_on "Sign in with Twitter"
   OmniAuth.config.test_mode = true
   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
   OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
   click_on "Sign in with Twitter"
   save_and_open_page
   #page.must_have_content "test_twitter_user, you are signed in!"
  end
  
end

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
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_on "Sign in"
    visit root_path
    # Then I should be signed in
    page.must_have_content "Portfolio"
    page.wont_have_content "There was a problem with your sign in"
  end
end

require "test_helper"

feature "Creating A Post" do
  scenario "new post is created" do
      # Given invalid project data is entered in a form
      visit new_user_session_path

      # When I sign in with valid info
      #fill_in "Email", with: "dbaynes@gci.com"
      #fill_in "Password", with: "password"
      #click_on "Sign in"
      #visit projects_path
      #click_link "Click Here to add a Post to this project."
      user = User.create!(email: "testemail@name.com", password: 'xxxxxaaass')
      
      visit new_post_path
      
      fill_in "How would you like to title this post?", with: "Test Title"
      fill_in "Post Away!", with: "Test content"
      
      #click_on "Create Post"
     #current_path.must_match /projects$/
     #page.text.must_include "Post was successfully created"
 
  end
end

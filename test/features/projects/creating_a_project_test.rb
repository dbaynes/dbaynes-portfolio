require "test_helper"

feature "Creating A Project" do
  #scenario "A - for new project, title should say new" do
  #  #Given a completed new portfolio form
  #  #When I submit the form
  #  #Then a new portfolio should be created and displayed
  #  #?click_on "Create New Project"
  #  #?page.text.must_include "New Project"
  #  visit root_path
  #  page.must_have_content "project"
  #end
  scenario "visit professional projects index page" do
    visit projects_path
    #page.must_have_content "You need to sign in or sign up before continuing."
    page.wont_have_link "New Post"
  end
  scenario "visit project with invalid credentials" do
      visit new_project_path
      current_path.must_match "/users/login"
      #page.text.must_include "Project could not be saved"
      #page.text.must_include "Name is too short"
      #page.text.must_include "Timeframe can't be blank"
      #page.text.must_include "Location can't be blank"
      page.text.must_include "Sign in"
    end
    scenario "Logged in as Admin, Projects index page has new button if admin" do
        # Given invalid project data is entered in a form
        sign_in(:admin)
        visit '/projects?portfolio_type=professional'
        page.text.must_include "New Professional Project"
          ##########################
        # if admin have new button
        ###########################
        #click_on 'Professional'
        #*page.text.must_include "Project could not be saved"
        #*page.text.must_include "Name is too short"
        #*page.text.must_include "Timeframe can't be blank"
        #*page.text.must_include "Location can't be blank"
        #*page.text.must_include "Project Description can't be blank"
      end
end

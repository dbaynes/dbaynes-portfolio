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
    page.must_have_content "You need to sign in or sign up before continuing."
  end
  scenario "visit project with invalid credentials" do
      visit projects_path
      current_path.must_match "/users/sign_in"
      #page.text.must_include "Project could not be saved"
      #page.text.must_include "Name is too short"
      #page.text.must_include "Timeframe can't be blank"
      #page.text.must_include "Location can't be blank"
      page.text.must_include "Sign in"
    end
    scenario "Logged in as Admin, Projects index page has new button if admin" do
        # Given invalid project data is entered in a form
        visit projects_path

        #fill_in "Name", with: "Q"
        # When the form is submitted with a Name and  and missing title field
        #*click_on "Project"
        # Then the form should be displayed again, with an error messages
        #*current_path.must_match /projects$/
        current_path.must_match "/users/sign_in"
        ##########################
        # if admin have new button
        ###########################
        click_on 'Professional'
        #*page.text.must_include "Project could not be saved"
        #*page.text.must_include "Name is too short"
        #*page.text.must_include "Timeframe can't be blank"
        #*page.text.must_include "Location can't be blank"
        #*page.text.must_include "Project Description can't be blank"
      end
end

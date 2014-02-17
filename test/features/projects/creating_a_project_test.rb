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
  scenario "new project has invalid data" do
      # Given invalid project data is entered in a form
      visit new_project_path
      fill_in "Name", with: "Q"
      # When the form is submitted with a Name and  and missing title field
      click_on "Create Project"
      # Then the form should be displayed again, with an error messages
      current_path.must_match /projects$/
      page.text.must_include "Project could not be saved"
      page.text.must_include "Name is too short"
      page.text.must_include "Timeframe can't be blank"
      page.text.must_include "Location can't be blank"
      page.text.must_include "Project Description can't be blank"
    end
end

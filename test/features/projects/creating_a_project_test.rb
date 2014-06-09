require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do
    sign_in(:admin)
    visit '/projects?portfolio_type=professional'
    page.text.must_include "No Professional projects created to date."
  end
  scenario "starting with no projects" do
    sign_in(:admin)
    visit '/projects?portfolio_type=professional'
    page.text.must_include "No Professional projects created to date."
    page.text.must_include "New Professional Project"
  end
  scenario "new project has invalid data" do
    # Given invalid project data is entered in a form
    sign_in(:admin)
    visit '/projects?portfolio_type=professional' 
    page.text.must_include "New Professional Project"
    click_link "New Professional Project"
    fill_in "Project Name", with: "Q"
  
    # When the form is submitted with a short name and missing technologies_used field
    click_on "Create Project"
  
    # Then the form should be displayed again, with an error message
    current_path.must_match /projects$/
    page.text.must_include "Name is too short (minimum is 5 characters)"
    page.text.must_include "Location can't be blank"
    page.text.must_include "Project description can't be blank"
  end
  scenario "adding a new project" do
    sign_in(:admin)
    visit '/projects?portfolio_type=professional' 
    page.text.must_include "New Professional Project"
    click_link "New Professional Project"
    page.text.must_include "Project Name"
    #project = Project.create!(name: "Test Name", timeframe:"Spring, 2014", location: "Seattle",project_description: "Good Stuff")
    
    fill_in "Project Name", with: "Test Name"
    fill_in "Time Frame", with: "Spring, 2012"
    fill_in "Location", with: "San Francisco"
    fill_in "Description", with: "Test!"
    click_on "Create Project"
    #visit '/projects?portfolio_type=professional' 
    page.text.must_include "Project was successfully created"  
  end
end


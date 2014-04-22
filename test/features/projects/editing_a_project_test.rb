require "test_helper"

feature "Editing A Project - Validate Show Action" do
  scenario "Edit - 01 - submit updates to an existing project" do
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
    page.text.must_include "Edit Project"
    click_on "Edit Project"
    page.text.must_include "Editing"
    fill_in "Time Frame", with: "Spring 2014"
    click_on "Update Project"
    visit '/projects?portfolio_type=professional' 
    page.text.must_include "Spring 2014"
    #redirect to show
    #page.text.must_include "successfully"
    #page.text.must_include "Web Developer"
    #page.text.wont_include "Code Fellows Portfolio"
  end
end

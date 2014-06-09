require "test_helper"

feature "Editing A Project - Validate Show Action" do
  scenario "Edit - 01 - submit updates to an existing project" do
    # Given an existing project
    # When I make changes
    # Then the changes should be saved and shown  
    project = Project.create!(name: "Web Developer", timeframe:"Spring, 2014", location: "Seattle",project_description: "Code Fellows Portfolio")
    sign_in(:editor)
    visit project_path(project)
    page.text.must_include "Web Developer"
    page.text.must_include "Code Fellows Portfolio"
  end
  scenario "Edit - 01 - Create new project for professional portfolio" do
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
    #page.text.must_include "Edit Project"
 end   
 scenario "Edit - 02 - submit updates to an existing project" do
    sign_in(:admin)
    #visit '/projects?portfolio_type=professional' 
    visit edit_project_path(projects(:project_7))
    #visit edit_project_path(projects(:portfolio,portfolio_type='Professional'))
    # needs fixture portfolio for fixture set 'projects'
    #visit '/projects/(:portfolio)/edit?portfolio_type=professional'
    #works - click_on "New Professional Project"
    page.text.must_include "Editing"
    fill_in "Time Frame", with: "Spring 2014"
    click_on "Update Project"
    page.text.must_include "Project was successfully updated."
    page.text.must_include "Spring 2014"
    #redirect to show
    #page.text.must_include "successfully"
    #page.text.must_include "Web Developer"
    #page.text.wont_include "Code Fellows Portfolio"
  end
end

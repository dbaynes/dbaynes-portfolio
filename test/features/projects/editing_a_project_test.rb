require "test_helper"

feature "Editing A Project - Validate Show Action" do
  scenario "Edit - 01 - submit updates to an existing project" do
    # Given an existing project
    # When I make changes
    # Then the changes should be saved and shown   # Given an existing project
    project = Project.create!(name: "Test Name", timeframe:"Spring, 2014", location: "Seattle",project_description: "Good Stuff")
    visit project_path(project)
    #click_on "Edit"
    #fill_in "Timeframe", with: "Spring 2014"
    click_on "Project"
    #redirect to show
    page.text.must_include "successfully"
    page.text.must_include "Web Developer"
    page.text.wont_include "Code Fellows Portfolio"
  end
end

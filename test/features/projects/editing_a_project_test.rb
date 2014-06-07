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
end

require "test_helper"

feature "As the site visitor, I want to see a developer's portfolio" do
  scenario "viewing all projects" do
    Project.create!(portfolio_type: "Athletic", name: "Jocko", timeframe: "Summer '42'", location: "Barnyard Cereal", project_description: "Ruby, Rails")
    visit projects_path
    #current_path.must_match /projects$/
    page.text.must_include "Barnyard Cereal"
    page.text.must_include "Ruby, Rails"
  end
end

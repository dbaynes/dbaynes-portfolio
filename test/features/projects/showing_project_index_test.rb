require "test_helper"

feature "As the site visitor, I want to see a developer's portfolio" do
  scenario "viewing projects index" do
    #Project.create!(portfolio_type: "Athletics", name: "Jocko", timeframe: "Summer '42'", location: "Barnyard Cereal", project_description: "Ruby, Rails")
    visit projects_path
    #visit '/projects?portfolio_type=athletics/'
    #current_path.must_match /projects$/
    page.text.must_include "Portfolio Professional Education Arts Athletics Recreational All Projects Portfolio Overview Login Sign in with Twitter"
    #page.text.must_include "Ruby, Rails"
  end
  scenario "viewing projects index as admin" do
    #Project.create!(portfolio_type: "Athletics", name: "Jocko", timeframe: "Summer '42'", location: "Barnyard Cereal", project_description: "Ruby, Rails")
    
    #user = User.create!(email: "admin@admin.com", password: 'password')
    sign_in(:admin)
    visit projects_path
    #visit '/projects?portfolio_type=athletics/'
    #current_path.must_match /projects$/
    page.text.must_include "Customize Portfolio"
    #page.text.must_include "Ruby, Rails"
  end
  
end

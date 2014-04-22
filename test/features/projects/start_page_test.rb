require "test_helper"
feature "As the site owner, I want to add a portfolio and projects so that I can show off my work" do
  scenario "adding a new portfolio type" do
     #Xvisit projects_path
    sign_in(:admin)
    visit root_path

    #click_on "Professional"
    ##click_on new_project_path(:portfolio_type=> "professional")
    ##page.text.must_include "Back to Portfolio Collection"
    #fill_in "Project Name", with: "Code Fellows Portfolio"
    #fill_in "Time Frame", with: "Spring 2012"
    #click_on "Create Project"
    #page.text.must_include "Project has been created"
    #page.text.must_include "Code Fellows Portfolio"
    ##Users :create, user: {role: 'admin'}
    page.text.must_include "Create a New Portfolio Type"
   end
scenario "adding a new project" do
   #Xvisit projects_path
  sign_in(:admin)
  visit '/projects?portfolio_type=professional'
  
  #click_on "Professional"
  ##click_on new_project_path(:portfolio_type=> "professional")
  ##page.text.must_include "Back to Portfolio Collection"
  #fill_in "Project Name", with: "Code Fellows Portfolio"
  #fill_in "Time Frame", with: "Spring 2012"
  #click_on "Create Project"
  #page.text.must_include "Project has been created"
  #page.text.must_include "Code Fellows Portfolio"
  ##Users :create, user: {role: 'admin'}
  page.text.must_include "No Professional projects created to date."
 end
end
feature "Start Page List of Portfolios" do
  scenario "The Start Page should have a list of portfolios" do
    visit root_path
    page.must_have_content "Education"
    page.must_have_content "Professional"
    page.must_have_content "Arts"
    page.must_have_content "Athletic"
    page.must_have_content "Recreational"
  end
end
feature "Start Page link to Professional Portfolio" do  
  scenario "Start Page link to Professional Portfolio" do
    visit root_path
    visit '/projects?portfolio_type=professional/'
    page.must_have_content "Professional"
  end
end

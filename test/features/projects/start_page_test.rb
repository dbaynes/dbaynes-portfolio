require "test_helper"

feature "Start Page confirmation" do
  scenario "Landing Page for the Portfolion App" do
    visit root_path
    page.must_have_content "Portfolio Home David Baynes"
    #page.must_have_content "Education"
    page.must_have_content "Professional"
    page.must_have_content "Arts"
    page.must_have_content "Athletic"
    page.must_have_content "Recreational"
    
  end
end
feature "Start Page List of Portfolios" do
  scenario "The Start Page should have a list of portfolios" do
    #Given a completed new portfolio form
    #When I submit the form
    #Then a new portfolio should be created and displayed
    visit root_path
    page.must_have_content "Education"
    page.must_have_content "Professional"
    page.must_have_content "Arts"
    page.must_have_content "Athletic"
    page.must_have_content "Recreational"
  end
end
feature "Start Page link to Education Portfolio" do  
  scenario "Start Page link to Education Portfolio" do
    visit root_path
    #click_link("Education", :match => :first)
    #portfolio.to_param = "education"
    #xvisit '/projects?portfolio_type=education'
    visit projects_path#?portfolio_type="education" 
    
    page.must_have_content "Education"
  end
end

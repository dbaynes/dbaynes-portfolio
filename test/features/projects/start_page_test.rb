require "test_helper"

feature "Start Page confirmation" do
  scenario "Landing Page for the Portfolion App" do
    render_views
    visit root_path
    #Xfind("h3", text: "Portfolio Home David Baynes")
    find("h3").text "Portfolio Home David Baynes"
    
    #page.text.must_include "Portfolio Overview"
    #page.must_have_content "Professional"
    #page.must_have_content "Arts"
    #page.must_have_content "Athletic"
    #page.must_have_content "Recreational"
    
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

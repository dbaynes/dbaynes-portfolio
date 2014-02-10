require "test_helper"

feature "Creating A Portfolio" do
  scenario "A - for new portfolios, title should say new" do
    #Given a completed new portfolio form
    #When I submit the form
    #Then a new portfolio should be created and displayed
    visit new_portfolio_path
    page.must_have_content "portfolio"
  end
  scenario "B - submit form data to create new portfolio 1" do
    #Given a completed new portfolio form
    portfolio = Portfolio.create!(portfolio_type:"Professional", timeframe:"Current", experience:"A bunch of professional experience here")
    # When I visit /portfolios
    visit portfolios_path
    #portfolio.to_param.must_equal "#{portfolio.id}-mini-test"
    page.text.must_include "Professional"
  end
  #scenario "C - submit form data to create new portfolio 2" do
  #   #Given a completed new portfolio form
  #   visit new_portfolio_path
  #   #fill_in "id", with: "2"
  #   fill_in "Portfolio type", with: "Recreational"
  #   fill_in "Timeframe", with: "Fall 2013 Through Summer 2014"
  #   fill_in "Location", with: "UW Extension"
  #   fill_in "Experience", with: "This is where I learned to program Ruby and Ruby on Rails the right way."
  #   # When I submit the form
  #   click_on "Create Portfolio"
  #   # Then a new portfolio should be created and displayed
  #   page.text.must_include "Portfolio was successfully created"
  #   page.text.must_include "where I learned to program Ruby and Ruby on Rails the right way"
  # end
  #scenario "D - submit form data to create new portfolio via Rails Cast 327" do
  #  portfolio = Portfolio.create!(portfolio_type:"Artistic",location:"UW Extension",timeframe:"Current")
  #  portfolio.to_param.must_equal "#{portfolio.id}-artistic"
  #end
end

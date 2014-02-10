require "test_helper"

feature "Editing A Portfolio" do
  scenario "Edit - 01 - submit updates to an existing portfolio" do
    # - The post author goes to an existing Post detail ("show") page
    # - That page should have a link to "Edit" that the author can click
    # - A form is filled in with the changed attributes
    # - The form is submitted
    # - The newly updated post should be shown to the author with a confirmation message
    
    # Given an existing portfolio
    ##portfolio = BlogPost.create(title:"Becoming a Code Fellow",name:"D Baynes", content: "Means striving for excellence.")
    ##visit portfolio_path(portfolio)
    ##fill_in "Title", with: "Becoming a web developer"
    ##click_on "Update Post"
    # Then the portfolio is updated
    portfolio = Portfolio.create!(portfolio_type:"Professional",experience:"A bunch of professional experience here",timeframe:"Current")
        visit portfolio_path(portfolio)
        # When I click edit and submit changed data
        click_on "Edit"
        fill_in "Timeframe", with: "current"
        click_on "Update Portfolio"
        # Then the portfolio is updated
        page.text.must_include "Portfolio was successfully updated"
        page.text.must_include "experience"
  end
end

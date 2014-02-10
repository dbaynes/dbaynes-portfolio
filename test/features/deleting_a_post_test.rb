require "test_helper"

feature "Deleting A Portfolio" do
  
  scenario "Delete - 01 - Portfolio is deleted with a click" do
      # Given an existing post
      Portfolio.create(portfolio_type: "Athletic", location: "Mobile, AL", experience: "Short Stop, Quarterback")
      visit portfolios_path
      # When the delete link is clicked
      #http_portfolio_location = portfolio(:http).location
      # One way - page.find(:xpath,"//tr[@class='#{portfolio-(:http).id}']").click_link("Destroy")
      #Class way:
      #CSS find href
      #page.find("[href='/portfolios/#{portfolios(:cr)}'][data-method]").click
      #page.wont_have_content portfolio_type
      page.text.must_include "Athletic"
      # dom_id
      
      ##click_on  "Destroy"
      ### Then the post is deleted
      ##page.wont_have_content "Becoming a Code Fellow"
    end
  
end

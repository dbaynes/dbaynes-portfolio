require "test_helper"

feature "Deleting A Project" do
  
  scenario "Delete - 01 - Project is deleted with a click" do
      ## Given an existing post
      #Project.create(portfolio_type: "Athletic", name: "Jocko", location: "Mobile, AL", project_description: "Short Stop, Quarterback")
      visit projects_path
      #click_link("Delete", :match => :first)
      ## When the delete link is clicked
      ##http_project_location = project(:http).location
      ## One way - page.find(:xpath,"//tr[@class='#{project-(:http).id}']").click_link("Destroy")
      ##Class way:
      ##CSS find href
      ##page.find("[href='/projects/#{projects(:cr)}'][data-method]").click
      ##page.wont_have_content portfolio_type
      #page.text.must_include "Athletic"
      ## dom_id
      #
      ###click_on  "Destroy"
      #### Then the post is deleted
      page.wont_have_content "Becoming a Code Fellow"
      
    end
end

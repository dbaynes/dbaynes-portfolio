require "test_helper"
include Devise::TestHelpers
feature "Creating A Post" do
  scenario "001-visit professional project page" do
    user = User.create!(email: "dbaynes@gci.com", password: 'jimsalem')
    sign_in(:author)

    visit '/projects?portfolio_type=professional/'
    #Xpage.text.must_include "Click Here to add a Post to this project."
    #Xpage.find_link('http://localhost:3000/posts/new?portfolio_type=professional&project=7').wont_be_nil
    page.all("a#{new_post_path}")
    visit '/projects/new?portfolio_type=professional'
    page.text.must_include "Professional"
    #fill_in "Project Name", with: "Prof Project 1"
    #fill_in "Time Frame", with: "Spring 2012"
    #fill_in "Location", with: "Seattle"
    #fill_in "Project Description", with: "description data"
    
    #page.find_link('new_post_path(:project=>p,:portfolio_type=>params[:portfolio_type])').wont_be_nil
    #click_on "#{new_post_path(:project=>p,:portfolio_type=>'professional',:project=>7)}"
  end
  scenario "002-new professional project is created" do
      user = User.create!(email: "admin2@admin.com", password: 'password')
      sign_in(:admin)
      #visit '/posts/new?portfolio_type=professional&project=1/'
      visit "/projects/new"
      fill_in "Project Name", with: "Prof Project 1"
      #fill_in "Timeframe", with: "Spring 2012"
      fill_in "Location", with: "Seattle"
      fill_in "Project Description", with: "description data"
      #fill_in "How would you like to title this post?", with: "Code Rails"
      #fill_in "Post Away!", with: "Test content"
      click_on "Create Project"
      #visit '/posts/new?portfolio_type=professional'
      
      page.text.must_include "Project was successfully created"
      
      #visit '/projects?portfolio_type=professional/'
       
      #click_on "Create Post"
      #current_path.must_match /projects$/
      #page.text.must_include "Post was successfully created"
  end
  scenario "003-new professional project Post is created" do
    user = User.create!(email: "member2@member.com", password: 'password')
    sign_in(:member)
      visit '/posts/new?portfolio_type=professional&project=1/'
      visit '/posts/new?portfolio_type=professional'
      fill_in "How would you like to title this post?", with: "Prof Project 1 Post 1"
      #fill_in "Time Frame", with: "Spring 2012"
      fill_in "Post Away!", with: "posting...."
      #click_on "Create Post"
      #Xvisit new_post_path
      #visit '/posts/new?portfolio_type=professional&project=1/'
      #page.text.must_include "created"
      #visit '/projects?portfolio_type=professional/'
      #page.text.must_include "Unpublished"
      
      #click_on "Create Post"
      #current_path.must_match /projects$/
      #page.text.must_include "Post was successfully created"
  end
  
  scenario "004-unauthenticated site visitors cannot visit new_post_path" do
     visit new_post_path
     page.wont_have_link "New Post"
     #page.must_have_content "You need to sign in or sign up before continuing"
  end
  scenario "005-unauthenticated site vistiors cannot see new post button" do
     # When I visit the blog index page
     #?visit posts_path
     # Path = projects?portfolio_type=professional
     visit '/projects?portfolio_type=professional/'
     #product.to_param.must_equal "#{product.id}-hello-world"
     # Then I should not see the "New Post" button
     page.wont_have_link "New Post"
   end
end

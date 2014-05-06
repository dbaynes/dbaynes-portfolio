feature "Editing a post" do
  scenario "submit form data to update a new post" do
    # Given an authorized user complets a new post format
    sign_in(:editor)
    visit new_post_path
    #visit edit_post_path(projects(:project_7))
    #fill_in "Title", with: posts(:cr).title
    #fill_in "content", with: posts(:cr).content
    page.text.must_include "How would you like to title this post?"
    ##fill_in "Title", with: "Test Name"
    ##fill_in "Content", with: "Test Content"
    #fill_in "How would you like to title this post?", with: "Test Name"
    #fill_in "Content", with: "Test Content"

    # When I submit the form
    #click_on "Create Post"

    # Then a new unpublished post should be created and displayed
    
    ##page.text.must_include posts(:cr).body
    ##assert page.has_css? "#author"
    ##page.text.must_include users(:author).email
    ##skip "status indicator"
    #TODO page.text.must_include "Status: Unpublished"
  end
end
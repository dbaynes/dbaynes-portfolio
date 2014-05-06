feature "Creating a post" do
  scenario "submit form data to create a new post" do
    # Given an authorized user complets a new post format
    sign_in(:member)
    visit '/posts/new?portfolio_type=professional(projects(:project_7)' 
    #visit new_post_path
    fill_in "How would you like to title this post?", with: posts(:post_7).title
    fill_in "Post Away!", with: posts(:post_7).title
    # When I submit the form
    ##click_on "Create Post"
    ##page.text.must_include "Successful"
    ##
  end
end
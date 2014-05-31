class PostMailer < ActionMailer::Base
  default from: "dlbaynes@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_approval_request.subject
  #
  def post_approval_request(post)
    @post = post
    #+ logger.info("@@@@@Post ID: #{@post.id}")
    mail to: "djbaynes@gmail.com", subject:"Post #{@post.id} was created and seeks your approval"
  end
end

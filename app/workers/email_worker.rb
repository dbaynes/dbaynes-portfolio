class EmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  
  def perfom(comment_id)
    comment = Comment.find(comment_id)
    PortfolioMailer.delay_for(5.minutes).welcome_email
  end
end
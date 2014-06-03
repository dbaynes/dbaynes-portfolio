class Api::PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    # make sure the thing posting has rights to post here... maybe with
    # http basic auth or a super secret token
    if Post.create_from_postmark(Postmark::Mitt.new(request.body.read))
      logger.info("@@@@@API PostsController #{request.body.inspect}")
      render :text => "Created a post!", status: :created
    else
      logger.info("@@@@@API PostsController - Problem with Inbound")
      render :text => "Unauthorized!", status: :unauthorized
    end
  end
end

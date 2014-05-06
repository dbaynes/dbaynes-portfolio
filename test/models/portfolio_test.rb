require "test_helper"

describe Portfolio do
  before do
    @portfolio = Portfolio.new
  end

  it "must be valid" do
    @portfolio.valid?.must_equal true
  end
end

require "test_helper"

describe PortfoliosController do

  before do
    @portfolio = portfolios(:one)
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portfolios)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create portfolio" do
    assert_difference('Portfolio.count') do
      post :create, portfolio: {  }
    end

    assert_redirected_to portfolio_path(assigns(:portfolio))
  end

  it "must show portfolio" do
    get :show, id: @portfolio
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @portfolio
    assert_response :success
  end

  it "must update portfolio" do
    put :update, id: @portfolio, portfolio: {  }
    assert_redirected_to portfolio_path(assigns(:portfolio))
  end

  it "must destroy portfolio" do
    assert_difference('Portfolio.count', -1) do
      delete :destroy, id: @portfolio
    end

    assert_redirected_to portfolios_path
  end

end

require 'test_helper'

class QuotesControllerTest < ActionController::TestCase

  def setup
    @user = users(:archer)
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should redirect new when not logged in' do
    get :new
    assert_not flash.empty?
    assert_redirected_to login_url
  end

end

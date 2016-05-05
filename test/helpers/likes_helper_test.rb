require 'test_helper'

class LikesHelperTest < ActionView::TestCase

  def setup
    @user = users :archer
    @quote = quotes :danger
    @other_quote = quotes :hands
  end

  test 'has_liked_when_not_liked' do
    assert_equal false, has_liked?(@user, @quote)
  end

  test 'has_liked_when_liked' do
    assert_equal true, has_liked?(@user, @other_quote)
  end

end
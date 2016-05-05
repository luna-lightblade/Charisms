require 'test_helper'

class QuoteTest < ActiveSupport::TestCase

  def setup
    @user = users :archer
    @quote = @user.quotes.build quote: 'Lorem ipsum', sayer: 'Craig', context: 'Craig is a weird guy'
  end

  test 'should be valid' do
    assert @quote.valid?
  end

  test 'user id should be present' do
    @quote.user_id = nil
    assert_not @quote.valid?
  end

  test 'quote should be present' do
    @quote.quote = '   '
    assert_not @quote.valid?
  end

  test 'quote should be at most 140 characters' do
    @quote.quote = 'a' * 141
    assert_not @quote.valid?
  end

  test 'context should be at most 250 characters' do
    @quote.context = 'a' * 251
    assert_not @quote.valid?
  end

  test 'sayer should be present' do
    @quote.quote = '   '
    assert_not @quote.valid?
  end

  test 'sayer should be at most 50 characters' do
    @quote.sayer = 'a' * 51
    assert_not @quote.valid?
  end

  test 'order should be most recent first' do
    assert_equal quotes(:most_recent), Quote.first
  end
end

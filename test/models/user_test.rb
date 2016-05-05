require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new name: 'Example User', email: 'user@example.com',
                     password: 'foobar', password_confirmation: 'foobar'
  end

  test 'authenticated? should return false for a user with nil digest' do
    assert_not @user.authenticated? :remember, ''
  end

  test 'associated quotes should be destroyed' do
    @user.save
    @user.quotes.create! quote: 'Lorem ipsum', sayer: 'Craig', context: 'Craig is a weird guy'
    assert_difference 'Quote.count', -1 do
      @user.destroy
    end
  end
end

module LikesHelper

  def has_liked?(quote)
    Like.where(:user_id => current_user.id, :quote_id => quote.id).count > 0
  end

  def like_count(quote)
    Like.where(:quote_id => quote.id).count
  end
end
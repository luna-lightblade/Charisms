class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    puts "IILIKE"
    @like = Like.new
    @like.user_id = current_user.id
    @like.quote_id = Quote.find(params[:quote]).id
    @like.save
  end

  def destroy
    puts "IIUNLIKE"
    Like.find(params[:id]).destroy
  end
end
class LikesController < ApplicationController

  def new
    puts "IINEW"
    @like = Like.new
  end

  def create
    puts "IILIKE"
    @like = Like.new
    @like.user_id = params[:user]
    @like.quote_id = params[:quote]
    @like.save
  end

  def destroy
    puts "IIUNLIKE"
    Like.find(params[:id]).destroy
  end
end
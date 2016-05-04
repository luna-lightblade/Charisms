class QuotesController < ApplicationController
  before_action :logged_in_user, only: [:new]
  before_action :admin_or_user, only: [:edit, :destroy]

  def index
    @quotes = Quote.paginate(page: params[:page])
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(user_params)
    @quote.user = current_user
    if @quote.save
      flash[:info] = 'Your quote has been added.'
      redirect_to quotes_url
    else
      render 'new'
    end
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update_attributes(user_params)
      flash[:success] = 'Quote updated'
      redirect_to quotes_url
    else
      render 'edit'
    end
  end

  def destroy
    Quote.find(params[:id]).destroy
    flash[:success] = 'Quote deleted'
    redirect_to quotes_url
  end

  def like
    @like = Like.new
    @like.user_id = current_user.id
    @like.quote_id = Quote.find(params[:quote]).id
    @like.save
    redirect_to quotes_url(@quote, :anchor => 'like')
  end

  private

  def user_params
    params.require(:quote).permit(:sayer, :quote, :context)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  # Confirms an admin user.
  def admin_or_user
    redirect_to(root_url) unless Quote.find(params[:id]).user == current_user or current_user.admin?
  end
end

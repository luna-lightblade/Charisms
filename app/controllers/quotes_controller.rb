class QuotesController < ApplicationController

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
      flash[:info] = "Your quote has been added."
      redirect_to quotes_url
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:quote).permit(:sayer, :quote, :context)
  end
end
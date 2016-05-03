class QuotesController < ApplicationController

  def index
    @quotes = Quote.paginate(page: params[:page])
  end

  def show
  end

  def create
    @quote = Quote.new(user_params)
    if @quote.save
      flash[:info] = "Your quote has been added."
    else
      render 'index'
    end
  end
end

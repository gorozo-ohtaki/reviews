class ToppagesController < ApplicationController
  def index
    if logged_in?
      @review = current_user.reviews.build
      @reviews = Review.all.order('created_at DESC').page(params[:page]).per(10)
    end 
  end
end

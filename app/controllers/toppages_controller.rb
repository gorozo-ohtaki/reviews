class ToppagesController < ApplicationController
  def index
    if logged_in?
      @reviews = Review.all
    end 
  end
end

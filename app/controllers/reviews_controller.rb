class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
     @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @reviews = Review.all.page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  private

  def review_params
    params.require(:review).permit(:title, :content)
  end
  
end

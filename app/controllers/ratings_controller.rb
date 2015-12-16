class RatingsController < ApplicationController

  def create
    rating = Rating.create(rating_params)
    redirect_to stories_path
  end

  private
  def rating_params
    params.require(:rating).permit(:rate, :user_id, :story_id)
  end

end

class Users::StoriesController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @stories = user.stories
  end

  def create
    story = Story.new(story_params)
    story.save
    redirect_to stories_path
  end

  def update
    story = Story.find(params[:id])
    story.update(story_params)
    redirect_to stories_path
  end

  private
  def story_params
    params.require(:story).permit(:category_id, :user_id, :title, :content)
  end
end

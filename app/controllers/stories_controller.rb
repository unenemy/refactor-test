class StoriesController < ApplicationController
  def index
     @stories = Story.all.includes(:category, :ratings, :user)
  end

  def destroy
    story = Story.find(params[:id])
    story.destroy
    redirect_to :back
  end

  def edit
   @story = Story.find(params[:id])
    render "stories/new", {:story => @story}
  end

  def translate
    story = Story.find(params[:id])
    if params[:translate_to] == 'original'
      render json: { title: story.title, content: story.content }
    else
      translation = TranslateService.translate_text(story,params[:translate_to])
      render json: { title: translation[0], content: translation[1] }
    end
  end

  private
  def story_params
    params.require(:story).permit(:category_id, :user_id, :title, :rating)
  end
end
class Categories::StoriesController < ApplicationController
  def index
    category = Category.find(params[:category_id])
    @stories = category.stories
    render "stories/index"
  end
end

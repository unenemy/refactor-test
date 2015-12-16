class StoriesController < ApplicationController
  def index
    if params[:category_id].present?
      @stories = Story.where(category_id: params[:category_id])
    elsif params[:user_id].present?
      @stories = Story.where(user_id: params[:user_id])
    else
      @stories = Story.all
    end
  end

  def create
    story = Story.new
    story.title = params[:title]
    story.content = params[:content]
    story.user_id = current_user.id
    story.category_id = Category.find_by(title: params[:category]).try(:id)
    story.save
    redirect_to '/stories'
  end

  def destroy
    story = Story.find(params[:id])
    story.destroy
    redirect_to :back
  end

  def translate
    story = Story.find(params[:id])
    if params[:translate_to] == 'original'
      render json: { title: story.title, content: story.content }
    else
      response = HTTParty.get(URI.escape("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20151216T114813Z.197ccc999631251d.146ca59b2140c076e5b4032a1558115221a73bbf&text=#{story.title}&lang=#{params[:translate_to]}"))
      title = JSON.parse(response.body)['text'].join
      response = HTTParty.get(URI.escape("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20151216T114813Z.197ccc999631251d.146ca59b2140c076e5b4032a1558115221a73bbf&text=#{story.content}&lang=#{params[:translate_to]}"))
      content = JSON.parse(response.body)['text'].join
      render json: { title: title, content: content }
    end
  end
end

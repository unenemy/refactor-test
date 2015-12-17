class TranslateService
  def initialize(story, lang)
    @story = story
    @lang = lang
  end

  def translate_text()
    translation = []
    translation << parse_answer(return_responce(@story.title, @lang))
    translation << parse_answer(return_responce(@story.content, @lang))
  end

  def return_responce(content, translate_to)
    HTTParty.get(URI.escape("#{Rails.application.secrets.site_url}key=#{Rails.application.secrets.yandex_key}&text=#{content}&lang=#{translate_to}"))
  end

  def parse_answer(response)
    JSON.parse(response.body)['text'].join
  end

end

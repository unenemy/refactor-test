class TranslateService
  def initialize(story, lang)
    @story = story
    @lang = lang
  end

  def translate_text()
    translation_content_and_title = []
    translation_content_and_title << parse_response_with_translate(get_response_with_translate(@story.title, @lang))
    translation_content_and_title << parse_response_with_translate(get_response_with_translate(@story.content, @lang))
  end

  private
  def create_url_for_translate(content, translate_to)
    URI.escape("#{Rails.application.secrets.site_url}key=#{Rails.application.secrets.yandex_key}&text=#{content}&lang=#{translate_to}")
  end

  def get_response_with_translate(content, translate_to)
    HTTParty.get(create_url_for_translate(content, translate_to))
  end

  def parse_response_with_translate(response)
    JSON.parse(response.body)['text'].join
  end

end

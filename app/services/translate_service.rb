class TranslateService
  SITE_URL = "https://translate.yandex.net/api/v1.5/tr.json/translate?"

  def self.translate_text(content, translate_to)
    [ parse_answer(create_url(content.title, translate_to)), parse_answer(create_url(content.content, translate_to)) ]
  end

  def self.create_url(content, translate_to)
    HTTParty.get(URI.escape("#{SITE_URL}key=#{Rails.application.secrets.yandex_key}&text=#{content}&lang=#{translate_to}"))
  end

  def self.parse_answer(response)
    JSON.parse(response.body)['text'].join
  end

end

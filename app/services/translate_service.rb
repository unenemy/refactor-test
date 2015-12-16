class TranslateService

  def self.translate_text(content, translate_to)
    url = "https://translate.yandex.net/api/v1.5/tr.json/translate?"
    [JSON.parse(HTTParty.get(URI.escape("#{url}key=#{Rails.application.secrets.yandex_key}&text=#{content.title}&lang=#{translate_to}")).body)['text'].join,
      JSON.parse(HTTParty.get(URI.escape("#{url}key=#{Rails.application.secrets.yandex_key}&text=#{content.content}&lang=#{translate_to}")).body)['text'].join ]
  end

end

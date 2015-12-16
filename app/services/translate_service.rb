class TranslateService

  def self.translate_text(content, translate_to)
    HTTParty.get(URI.escape("https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20151216T114813Z.197ccc999631251d.146ca59b2140c076e5b4032a1558115221a73bbf&text=#{content}&lang=#{translate_to}"))
  end
end
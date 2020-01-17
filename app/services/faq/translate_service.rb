module FaqModule

  class TranslateService
    def initialize(params)
      @word = params["word"]
      @lang = params["lang"]
    end
 
    def call

      return 'Informe o termo a ser traduzido.' if @word == nil || @word.blank?
      return 'Informe o idioma.' if @lang == nil || @lang.blank?

      lang_param = nil
      if @lang.upcase == "PORTUGUES" || @lang.upcase == "PORTUGUÊS"
        lang_param = "en-pt"
      elsif @lang.upcase == "INGLES" || @lang.upcase == "INGLÊS"
        lang_param = "pt-en"
      end

      return 'Informe um idioma válido, portugues ou ingles.' if lang_param == nil

      key = "trnsl.1.1.20200115T143401Z.c576aeaaa427e198.5da5b5f78ee0d26cb1147e8ee9c5d01a2aec91a2"
      url = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=#{key}&text=#{@word}&lang=#{lang_param}"
      res = RestClient.get(url)
      value = JSON.parse(res.body)['text'][0].to_s

      response = "O termo #{@word} traduzido para #{@lang} é: #{value}"
      return response

    end
  end
end
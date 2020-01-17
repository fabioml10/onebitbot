module FaqModule

  class TranslateService
    def initialize(params)
      @word = params["word"]
      @lang = params["lang"]
    end
 
    def call
      
      return 'Informe uma palavra.' if @word == nil
      return 'Informe o idioma.' if @lang == nil

      lang_param = "pt-en"
      if @lang[0,1].upcase == "P"
        lang_param = "en-pt"
      end

      key = "trnsl.1.1.20200115T143401Z.c576aeaaa427e198.5da5b5f78ee0d26cb1147e8ee9c5d01a2aec91a2"
      url = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=#{key}&text=#{@word}&lang=#{lang_param}"
      res = RestClient.get(url)
      value = JSON.parse(res.body)['text'][0].to_s

      response = "O termo #{@word} traduzido para #{@lang} é: #{value}"
      return response

    end
  end
end
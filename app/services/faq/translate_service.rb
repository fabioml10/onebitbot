module FaqModule

  class TranslateService
    def initialize(params)
      @word = params["word"]
    end
 
    def call
      
      return 'Informe uma palavra.' if @word == nil

      key = "trnsl.1.1.20200115T143401Z.c576aeaaa427e198.5da5b5f78ee0d26cb1147e8ee9c5d01a2aec91a2"
      url = "https://translate.yandex.net/api/v1.5/tr.json/translate?key=#{key}&text=#{@word}&lang=pt-en"
      res = RestClient.get(url)
      value = JSON.parse(res.body)['text']

      response = "O termo #{@word} traduzido para o inglês é: #{value}"
      return response

    end
  end
end
require_relative './../../spec_helper.rb'
 
describe FaqModule::TranslateService do
  before do
    @word = "carro"
    @lang = "ingles"
    @translate = "the car"
  end
 
  describe '#call' do
    context "Without word param" do
      it "will receive a error" do
        @translateService = FaqModule::TranslateService.new({"lang" => @lang})
        response = @translateService.call()
        expect(response).to match("Informe uma palavra.")
      end
    end

    context "Without lang param" do
      it "will receive a error" do
        @translateService = FaqModule::TranslateService.new({"word" => @word})
        response = @translateService.call()
        expect(response).to match("Informe o idioma.")
      end
    end
 
    context "With Valid params" do
      before do
        @translateService = FaqModule::TranslateService.new({"word" => @word, "lang" => @lang})
        @response = @translateService.call()
      end
 
      it "Receive success message" do
        expect(@response).to match("O termo #{@word} traduzido para #{@lang} é: #{@translate}")
      end

    end
  end
end
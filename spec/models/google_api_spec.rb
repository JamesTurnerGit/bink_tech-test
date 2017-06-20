require 'spec_helper'

describe GoogleApi do
  let(:item1) {double("item1")}
  let(:item2) {double("item2")}
  let(:item3) {double("item3")}
  let(:item4) {double("item4")}
  let(:item5) {double("item5")}

  let(:parsed_response){
    {"items" => [{"link" => item1},{"link" => item2},{"link" => item3},{"link" => item4},{"link" => item5}]}
  }

  let(:raw_response){double("raw_response",parsed_response: parsed_response)}

  before(:each){
    allow(HTTParty).to receive(:get).and_return(raw_response)
    allow(Response).to receive(:new)
    allow(Time).to receive(:new).and_return(Time.mktime(2015,10,21,7,28,00))
    allow(Time).to receive(:now).and_return(Time.mktime(2015,10,21,7,28,01))
  }

  let(:noun)   {double("noun")}
  let(:colour) {double("colour")}

  describe "#search" do
    it "should call get on httparty" do
      GoogleApi.search(noun,colour)
      expect(HTTParty).to have_received(:get)
    end
    it "should build the correct response" do
      result = GoogleApi.search(noun,colour)

      links = [item1,item2,item3,item4,item5]
      response_time = 1000
      date = "21/10/2015"
      time = "07:28:01"
      expect(Response).to have_received(:new).with(noun,colour,links,response_time,date, time)
    end
  end
end

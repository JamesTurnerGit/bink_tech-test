require 'spec_helper'

describe Response do

  let(:noun) {double("noun")}
  let(:colour) {double("colour")}
  let(:results) {double("results")}
  let(:response_time) {double("response_time")}

  before(:each){
    allow(Time).to receive(:now).and_return(Time.mktime(2015,10,21,7,28))
  }

  subject{ Response.new(noun, colour, results, response_time)}

  describe "#new" do
    it "stores and returns all attributes from initialize" do
      expect(subject.noun).to eq noun
      expect(subject.colour).to eq colour
      expect(subject.results).to eq results
      expect(subject.response_time).to eq response_time
    end
  end

  describe "#date" do
    it "returns date as a string" do
      expect(subject.date).to eq "21/10/2015"
    end
  end

  describe "#time" do
    it "returns time as a string" do
      expect(subject.time).to eq "07:28:00"
    end
  end
end

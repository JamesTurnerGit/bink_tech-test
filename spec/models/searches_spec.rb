require 'spec_helper'

describe Searches do
  let(:result)         {double("result")}
  let(:response_time)  {double("response_time")}
  let(:search_api)     {double("search_api",search: [result,response_time])}

  let(:results)        {double("results")}
  let(:response)       {double("response",results: results)}
  let(:new_results)    {double("new results")}
  let(:new_response)   {double("new response",results: new_results)}


  let(:response_class) {double("response_class",new: response)}

  subject{ Searches.new(search_api,response_class)}

  describe "#new" do
    it "starts with an empty list of seaches" do
      expect(subject.searches).to be_empty
    end
  end

  describe "#new_search" do
    before(:each){
      subject.new_search("term_1","term_2")
    }
    it "queries search api with terms" do
      expect(search_api).to have_received(:search).with("term_1 term_2").once
    end
    it "makes a response object" do
      expect(response_class).to have_received(:new).with("term_1", "term_2", result, response_time).once
    end
    it "puts the response_object into searches[]" do
      expect(subject.searches[0]).to eq response
    end
  end

  describe "#latest_search" do
    it "returns nil if no search has been ran yet" do
      expect(subject.latest_search).to be_nil
    end
    it "returns the most recent search information" do
      subject.new_search("term_1","term_2")
      expect(subject.latest_search).to eq results

      allow(response_class).to receive(:new).and_return(new_response)

      subject.new_search("term_1","term_2")
      expect(subject.latest_search).to eq new_results
    end
  end

  describe "#previous_searches" do
    it "returns nil until at least two searches have been run" do
      expect(subject.previous_searches).to be_nil
      subject.new_search("term_1","term_2")
      expect(subject.previous_searches).to be_nil
    end
    it "returns an array with the more recent searches on top otherwise, skipping the most recent" do
      subject.new_search("term_1","term_2")
      allow(response_class).to receive(:new).and_return(new_response)
      subject.new_search("term_1","term_2")
      subject.new_search("term_1","term_2")
      expect(subject.previous_searches).to eq [new_response,response]
    end
  end
end

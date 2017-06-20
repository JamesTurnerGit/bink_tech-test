require 'spec_helper'

describe MainController do
  describe "GET index" do
    subject{ get :index}
    it "gets the index view" do
      expect(subject.status).to eq 200
    end
    it "renders the right template" do
      expect(subject).to render_template ("main/index")
    end
  end
end

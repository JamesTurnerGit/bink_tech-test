class MainController < ApplicationController
  include MainHelper
  def index
    @random_noun = random_noun
  end

  def search
    @searches = Searches.instance
    searches.new_search params[:colour], params[:noun]
    @random_noun = random_noun
    render "index"
  end
end

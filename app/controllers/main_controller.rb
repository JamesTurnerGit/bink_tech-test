class MainController < ApplicationController
  include MainHelper
  def index
    @searches = Searches.instance
    @random_noun = random_noun
  end

  def search
    searches = Searches.instance
    searches.new_search params[:colour], params[:noun]
    redirect_to action: "index"
  end
end

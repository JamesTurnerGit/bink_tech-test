class MainController < ApplicationController
  include MainHelper
  def index
    @random_noun = random_noun
  end

  def search
    @colour =  params[:colour]
    @noun   = params[:noun]

    searches = Searches.instance
    searches.new_search @colour, @noun

    @images = searches.latest_search
    @previous_searches = searches.previous_searches

    @random_noun = random_noun
    render "index"
  end
end

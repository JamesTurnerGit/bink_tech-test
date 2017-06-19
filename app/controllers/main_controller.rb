class MainController < ApplicationController
  include MainHelper
  def index
    @random_noun = random_noun
  end

  def search
    colour =  params[:colour]
    noun   = params[:noun]
    result = GoogleApi.search("#{colour} #{noun}")

    @most_recent_search = (colour,noun,result)
    @images = result.results

    @random_noun = random_noun
    render "index"
  end
end

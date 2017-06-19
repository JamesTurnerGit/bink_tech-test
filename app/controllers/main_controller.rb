class MainController < ApplicationController
  include MainHelper
  def index
    @random_noun = random_noun
  end

  def search
    colour =  params[:colour]
    noun   = params[:noun]
    @random_noun = random_noun
    render "index"
  end
end

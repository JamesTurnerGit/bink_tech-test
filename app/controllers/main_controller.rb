class MainController < ApplicationController
  include MainHelper
  def index
  end
  def search
    render "index"
  end
end

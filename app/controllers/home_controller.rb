class HomeController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end
  
end

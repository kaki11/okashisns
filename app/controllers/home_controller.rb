class HomeController < ApplicationController
  def index
    @microposts = Micropost.all
  end
end

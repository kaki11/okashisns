class HomeController < ApplicationController
  def index
    @microposts = Micropost.all
    ranking_rakuten_api
  end

  def ranking_rakuten_api

    categories = RakutenWebService::Recipe.ranking
      categories.each do |category| 
        @imageUrl = category['foodImageUrl'] 
        @recipeTitle = category['recipeTitle'] 
        @recipeUrl = category['recipeUrl'] 
      end

  end

end

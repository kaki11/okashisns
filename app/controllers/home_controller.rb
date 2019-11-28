class HomeController < ApplicationController
  require './lib/api/rakuten_client.rb'
  
  def index
    @sweets = Category.sweets_categories
    @bread = Category.bread_categories
    @other = Category.other_categories
    @microposts = Micropost.all.limit(8)

    recipes = recipe_ranking_api
    # 親配列に全ての要素を並べる →ランダムに並び替える
    @recipe_ranking = recipes.flatten!.sample(5)
  end

  def about
  end

end
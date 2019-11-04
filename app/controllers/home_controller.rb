class HomeController < ApplicationController
  def index
    @microposts = Micropost.all
    sweets_ranking_api
    pan_ranking_api

  end

  def sweets_ranking_api
    res = RakutenWebService::Recipe.ranking(category_id = 21)
    # 取得したデータを配列に格納し直す
    @sweets_recipes = res.map{|recipe| recipe}
  end

  def pan_ranking_api
    res = RakutenWebService::Recipe.ranking(category_id = 22)
    # 取得したデータを配列に格納し直す
    @pan_recipes = res.map{|recipe| recipe}
  end

end

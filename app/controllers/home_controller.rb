class HomeController < ApplicationController
  def index
    @sweets_categories = Category.limit(10)
    @bread_categories = Category.limit(7).offset(10)
    @other_categories = Category.offset(17)
    @microposts = Micropost.all.limit(8)
    recipe_ranking_api
  end

  def recipe_ranking_api
    res1 = RakutenWebService::Recipe.ranking(category_id = 21)
    res2 = RakutenWebService::Recipe.ranking(category_id = 22)
    # 取得したデータを配列に格納し直す
    sweets_recipes = res1.map{|recipe| recipe}
    pan_recipes = res2.map{|recipe| recipe}
    # 配列をまとめる
    recipes = sweets_recipes.push(pan_recipes)
    # 親配列に全ての要素を並べる→ランダムに並び替える
    @recipe_ranking = recipes.flatten!.sort_by{rand}
  end

end
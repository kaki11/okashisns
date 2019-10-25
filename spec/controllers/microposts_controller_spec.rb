require 'rails_helper'

describe MicropostsController do

  describe 'GET #new' do
    it "newに移管すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "micropostの値が合っているか" do    #インスタンス変数の値を確かめる
      micropost = create(:micropost)
      get :edit, params: { id: micropost }    # アクション名と渡すパラメーターの２つが引数
      expect(assigns(:micropost)).to eq micropost
    end

    it "editに移管すること" do   #期待したビューに遷移するか
      micropost = create(:micropost)
      get :edit, params: { id: micropost }
      expect(response).to render_template :edit
    end
  end


  # homeControllerにかく
  describe 'GET #index' do
    it "投稿が新しい順に並んでいること" do
      microposts = create_list(:micropost, 3) 
      get :index
      expect(assigns(:microposts)).to match(microposts.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "indexに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

end
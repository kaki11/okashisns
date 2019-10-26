require 'rails_helper'

describe MicropostsController do
  let(:user) { create(:user) }

  describe 'GET #new' do
    it "newに移管すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    it "showに移管すること" do
      micropost = create(:micropost)
      get :show, params: { id: micropost }
      expect(response).to render_template :show
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

  describe 'DELETE #destroy' do
    # let!(:micropost) { create :micropost }
    it 'micropostが削除されること' do
    end
  end

end
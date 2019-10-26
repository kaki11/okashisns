require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  let(:micropost) { create(:micropost)}

  describe 'GET #show' do
    it "showに遷移すること" do
      get :show, params: { id: user.id }
      expect(response).to render_template :show
    end
  end

  context 'ログインしているとき' do
    include SessionsHelper
    render_views
    before do
      log_in user
      get :show, params: { id: user.id }
    end

    it '『投稿する』が表示される' do
      expect(response.body).to include "投稿する"
    end
  end

  context 'ログインしていないとき' do
    render_views
    before do
      get :show, params: { id: user.id }
    end

    it '『投稿する』が表示されない' do
      expect(response.body).to_not include "投稿する"
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end

    it "newに遷移すること" do
      expect(response).to render_template :new
    end

    it '@userが正しく定義されている' do
      expect(assigns(:user)).to be_a_new(User)
    end
  end

end

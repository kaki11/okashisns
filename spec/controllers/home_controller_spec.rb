require 'rails_helper'

describe HomeController do
  let(:user) { create(:user) }

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

    context 'ログインしているとき' do
      include SessionsHelper
      render_views
      before do
        log_in user
        get :index, params: { user_id: user.id }
      end

      it '『home』が表示される' do
        expect(response.body).to include "home"
      end

      it '『Logout』が表示される' do
        expect(response.body).to include "Logout"
      end

    end

    context 'ログインしていないとき' do
      render_views
      before do
        get :index
      end

      it '『Login』が表示される' do
        expect(response.body).to include "Login"
      end
    end
  end
end

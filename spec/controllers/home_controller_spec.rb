require 'rails_helper'

describe HomeController do
  let(:user) { create(:user) }

  describe 'GET #index' do

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

  describe 'GET #about' do

    it "aboutに遷移すること" do
      get :about
      expect(response).to render_template :about
    end
  end
  
end

require 'rails_helper'

describe MicropostsController do
  include SessionsHelper
  let(:user) { create(:user) }
  let(:micropost) { create(:micropost)}

  describe 'GET #new' do
    before do
      log_in user
      get :new
    end

    it "newに遷移すること" do
      expect(response).to render_template :new
    end

    it '@micropostが正しく定義されている' do
      expect(assigns(:micropost)).to be_a_new(Micropost)
    end
  end

  describe 'GET #show' do
    it "showに遷移すること" do
      get :show, params: { id: micropost }
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    before do
      log_in user
    end
    xit "micropostの値が合っているか" do    #インスタンス変数の値を確かめる
      get :edit, params: { id: micropost }    # アクション名と渡すパラメーターの２つが引数
      expect(assigns(:micropost)).to eq micropost
    end

    xit "editに遷移すること" do   #期待したビューに遷移するか
      get :edit, params: { id: micropost }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    before do
      log_in user
    end
    # let(:params) do
    #   { params: { micropost: attributes_for(:micropost) } }
    # end
    let(:params) { { user_id: user.id, micropost: attributes_for(:micropost) } }
   
    context '保存に成功した場合' do
      subject {
        post :create,
        params: params
      }
      it 'データベースに保存ができたか' do
        expect{ subject }.to change(Micropost, :count).by(1)
        # expect{post :create, params}.to change(Micropost, :count).by(1)
      end

      it 'マイページにリダイレクトしているか' do
        subject
        expect(response).to redirect_to(user_path(user))
        # post :create, params
        # expect(response).to redirect_to user_path(user)
      end
    end

    context '保存に失敗した場合' do
      render_views
      let(:invalid_params) { { user_id: user.id, micropost: attributes_for(:micropost, picture: nil) } }
      subject {
        post :create,
        params: invalid_params
      }

      it 'データベースに保存が行われなかったか' do 
          expect{ subject }.not_to change(Micropost, :count)
      #   expect{
      #     post :create, params: { micropost: attributes_for(:micropost, title: nil, content: nil, picture: nil) }
      #   }.to change(Micropost, :count).by(0)
      end

      it 'リダイレクトされているか' do
        subject
        expect(response).to render_template :new
        # post :create, params: { micropost: attributes_for(:micropost, picture: nil) }
        # expect(response).to render_template :new
      end
      
      it 'エラーメッセージが表示されているか' do
        # post :create, params: { micropost: attributes_for(:micropost, picture: nil) }
        subject
        expect(response.body).to_not include "can't be blank"
      end
    end

    context 'ログインしていない場合' do
      it 'ログインページにリダイレクトしているか' do
        log_out
        post :create, params: params
        expect(response).to redirect_to(login_path)
        # get :new 
        # expect(response).to redirect_to login_path
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      log_in user
    end
    let(:user) { create(:user) }
    let!(:user_micropost) { create(:micropost, user_id: user.id) }
    
    it 'micropostが削除されること' do
      expect{delete :destroy, params: { id: user_micropost.id }}.to change(Micropost, :count).by(-1)
    end
    it '前のページにリダイレクトする' do
      delete :destroy, params: { id: micropost.id }
      expect(response).to redirect_to request.referrer || root_url
    end
  end

end
require 'rails_helper'

feature 'micropost', type: :feature do
  let(:user) { create(:user) }

  scenario 'post micropost' do
    # ログイン前には投稿ボタンがない
    visit user_path(user)
    expect(page).to have_no_content('投稿する')

    # ログイン処理
    visit login_path
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq user_path(user)
    expect(page).to have_content('投稿する')

    # micropostの投稿
    expect {
      click_link('投稿する')
      expect(current_path).to eq new_micropost_path
      fill_in 'title', with: 'たいとる'
      fill_in 'content', with: 'てすと'
      select 'カテゴリー選択', from: "micropost_category_id", visible: false
      find('input[type="file"]').click
      attach_file "picture", "app/assets/images/dami-.png"
      click_on "投稿"
    }.to change(Micropost, :count).by(0)
  end

end
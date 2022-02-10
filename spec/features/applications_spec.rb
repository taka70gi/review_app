require 'rails_helper'

feature 'application', type: :feature do
  describe "header" do
    given!(:drama) { create(:drama) }

    before do
      visit dramas_path
    end

    it 'ページタイトルが表示されること' do
      within("div.header_title") do
        expect(page).to have_content("韓ドラレビュー")
      end
    end

    it '検索のリンクが正しくされていること' do
      within("div.header_search_field") do
        click_on "#{taxon.name}(#{taxon.products.count})"
        expect(current_path).to eq potepan_category_path(taxon.id)
      end
      expect(page).to have_content(taxon.name)
    end
  end

  describe "admin" do
    given!(:admin) { create :user, :admin }
    given!(:drama) { create(:drama) }
    before do
      sign_in admin
      visit dramas_path
    end

    it '管理者ユーザー表示されること' do
      within("div.header_name") do
        expect(page).to have_content(admin.name)
      end
    end

    it '管理者ユーザー用のナビバーが表示されること' do
      within("ul.header-nav-menu") do
        expect(page).to have_content("ドラマ管理ページ")
        expect(page).to have_content("ドラマ新規登録")
        expect(page).to have_content("ログアウト")
      end
    end

    it 'ドラマ管理ページのリンクが正しくされていること' do
      within("ul.header-nav-menu") do
        click_on "ドラマ管理ページ"
        expect(current_path).to eq admin_dramas_path
      end
      expect(page).to have_content("ドラマ管理ページ")
    end

    it 'ドラマ新規登録のリンクが正しくされていること' do
      within("ul.header-nav-menu") do
        click_on "ドラマ新規登録"
        expect(current_path).to eq new_admin_drama_path
      end
      expect(page).to have_content("ドラマ新規登録")
    end

    it 'ログアウトのリンクが正しくされていること' do
      within("ul.header-nav-menu") do
        click_on "ログアウト"
        expect(current_path).to eq destroy_user_session_path
      end
      expect(page).to have_content("ドラマ新規登録")
    end
  end

  describe "general" do
    given!(:general) { create :user, :general }
    given!(:drama) { create(:drama) }
    before do
      sign_in general
      visit dramas_path
    end

    it '一般ユーザー表示されること' do
      within("div.header_name") do
        expect(page).to have_content(general.name)
      end
    end

    it '一般ユーザー用のナビバーが表示されること' do
      within("ul.header-nav-menu") do
        expect(page).to have_content("マイページ")
        expect(page).to have_content("アカウント編集")
        expect(page).to have_content("ログアウト")
      end
    end

    it 'マイページのリンクが正しくされていること' do
      within("ul.header-nav-menu") do
        click_on "マイページ"
        expect(current_path).to eq users_path
      end
      expect(page).to have_content("マイページ")
    end

    it 'アカウント編集のリンクが正しくされていること' do
      within("ul.header-nav-menu") do
        click_on "アカウント編集"
        expect(current_path).to eq edit_user_path(general)
      end
      expect(page).to have_content("アカウント編集")
    end
  end
end

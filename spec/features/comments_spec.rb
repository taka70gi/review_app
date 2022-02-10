require 'rails_helper'

feature 'comment', type: :feature do
  describe "index" do
    let!(:general) { create :user, :general }
    let!(:drama) { create(:drama) }
    before do
      sign_in general
      visit dramas_path
    end

    it 'ドラマタイトルが表示されること' do
      within("div.drama_right") do
        expect(page).to have_content(drama.name)
      end
    end
    it 'ドラマ画像が表示されること' do
      within("div.drama_list") do
        expect(page).to have_content(drama.name)
        expect(page).to have_selector("img,[src$='#{image.filename}']")
      end
    end

    it 'レビューしたユーザー名が表示されること' do
    end

    it 'レビュー内容が表示されること' do
    end

    it '管理者ページへのリンクが正しくされていること' do
    end

    it '削除が正しくされていること' do
    end

  end
  describe "new" do
    let!(:general) { create :user, :general }
    let!(:drama) { create(:drama) }
    before do
      sign_in general
      visit dramas_path
    end

    it 'ドラマタイトルが表示されること' do
      within("div.drama_list") do
        expect(page).to have_content(drama.name)
      end
    end

    it 'ドラマ画像が表示されること' do
      within("div.drama_list") do
        expect(page).to have_content(drama.name)
        expect(page).to have_selector("img,[src$='#{image.filename}']")
      end
    end

    it 'レビュー投稿画面が表示されること' do
      within("div.drama_list") do
      end
    end

    it 'レビュー投稿がされること' do
      within("div.drama_list") do
      end
    end

    it 'ドラマ詳細ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end

    it 'ドラマ一覧ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end
  end

  describe "edit" do
    let!(:general) { create :user, :general }
    let!(:drama) { create(:drama) }
    before do
      sign_in general
      visit dramas_path
    end

    it 'ドラマタイトルが表示されること' do
      within("div.drama_list") do
        expect(page).to have_content(drama.name)
      end
    end

    it 'ドラマ画像が表示されること' do
      within("div.drama_list") do
        expect(page).to have_content(drama.name)
        expect(page).to have_selector("img,[src$='#{image.filename}']")
      end
    end

    it 'レビュー投稿画面が表示されること' do
      within("div.drama_list") do
      end
    end

    it 'レビュー投稿がされること' do
      within("div.drama_list") do
      end
    end

    it 'ドラマ詳細ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end

    it 'ドラマ一覧ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end
  end
end

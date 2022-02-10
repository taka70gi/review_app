require 'rails_helper'

feature 'drama', type: :feature do
  describe "index" do
    given!(:general) { create :user, :general }
    given!(:drama) { create(:drama) }
    given(:image) { create(:image) }
    before do
      sign_in general
      visit dramas_path
    end

    it 'ドラマタイトルが表示されること' do
      binding.pry
      within("div.drama_list") do
        expect(page).to have_content(drama.name)
      end
    end

    it 'ドラマ画像が表示されること' do
      within("div.drama_list") do
        expect(page).to have_selector("img,[src$='#{image.filename}']")
      end
    end

    it 'ドラマ詳細ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end
  end

  describe "show" do
    given!(:general) { create :user, :general }
    given!(:drama) { create(:drama) }
    given(:image) { create(:image) }
    before do
      sign_in general
      visit dramas_path
    end

    it 'ドラマタイトルが表示されること' do
      binding.pry
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

    it 'ドラマあらすじが表示されること' do
      within("div.drama_list") do
        expect(page).to have_content(drama.name)
      end
    end

    it 'レビュー一覧が表示されること' do
      within("div.drama_list") do

      end
    end

    it 'レビューがない場合は表示されないこと' do
      within("div.drama_list") do

      end
    end

    it 'レビュー投稿ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end

    it 'ドラマ詳細ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end

    it 'お気に入り機能が正しくされていること' do
      within("div.drama_list") do
      end
    end
  end

  describe "search" do
    given!(:general) { create :user, :general }
    given!(:drama) { create(:drama) }
    given(:image) { create(:image) }
    before do
      sign_in general
      visit dramas_path
    end

    it '検索ワードが表示されること' do
      within("div.drama_list") do
        expect(page).to have_content(drama.name)
      end
    end
    it '検索結果が存在する場合ドラマ情報が表示されること' do
      within("div.drama_list") do
        expect(page).to have_content(drama.name)
      end
    end

    it '検索結果が存在する場合件数が表示されること' do
      within("div.drama_list") do
        expect(page).to have_content(drama.name)
      end
    end

    it '検索結果が存在しない場合ドラマ情報が表示されないこと' do
      within("div.drama_list") do
        expect(page).to have_content(drama.name)
      end
    end

    it '検索結果が存在しない場合検索結果:0が表示されること' do
      within("div.drama_list") do
        expect(page).to have_content(drama.name)
      end
    end

    it 'ドラマ一覧ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end
  end

end

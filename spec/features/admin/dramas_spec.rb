require 'rails_helper'

feature 'drama', type: :feature do
  describe "index" do
    given!(:admin) { create :user, :admin }
    given!(:drama) { create(:drama) }
    given(:image) { create(:image) }
    before do
      sign_in admin
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

    it 'ドラマ登録個数分表示されること' do
      within("div.drama_list") do
      end
    end

    it 'ドラマ新規登録ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end

    it '管理者ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end

    it '削除が正しくされていること' do
      within("div.drama_list") do
      end
    end
  end

  describe "new" do
    given!(:admin) { create :user, :admin }
    given!(:drama) { create(:drama) }
    given(:image) { create(:image) }
    before do
      sign_in admin
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

    it 'ドラマ管理ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end

    it '管理者ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end
  end

  describe "edit" do
    given!(:admin) { create :user, :admin }
    given!(:drama) { create(:drama) }
    given(:image) { create(:image) }
    before do
      sign_in admin
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

    it 'ドラマ管理ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end

    it '管理者ページへのリンクが正しくされていること' do
      within("div.drama_list") do
      end
    end
  end

end

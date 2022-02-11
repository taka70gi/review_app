require 'rails_helper'

feature 'homes', type: :feature do
  describe "index" do
    given!(:admin) { create :user, :admin }
    given!(:drama) { create(:drama) }
    given(:image) { create(:image) }
    before do
      sign_in admin
      visit homes_path
    end

    it 'ドラマ管理ページへのリンクが正しくされていること' do
      within("div.admin_position") do
        click_on "ドラマ管理"
        expect(current_path).to eq admin_dramas_path
      end
      expect(page).to have_content("ドラマ管理ページ")
    end

    it 'レビュー管理ページへのリンクが正しくされていること' do
      within("div.admin_position") do
        click_on "レビュー管理"
        expect(current_path).to eq comments_path
      end
      expect(page).to have_content("ドラマ管理ページ")
    end
  end
end

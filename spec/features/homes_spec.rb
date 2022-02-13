require 'rails_helper'

feature 'homes', type: :feature do
  describe "管理者ページ" do
    given(:admin) { create :user, :admin }
    given(:general) { create :user, :general }
    given(:drama) { create(:drama) }
    given(:comment) { create(:comment) }
    before do
      sign_in admin
      general.comments << comment
      drama.comments << comment
      visit homes_path
    end

    it 'ドラマ管理ページへのリンクが正しくされていること' do
      within("div.admin_position") do
        click_on "ドラマ管理"
        expect(current_path).to eq admin_dramas_path
      end
      expect(page).to have_content("ドラマ管理ページ")
      expect(page).to have_content(drama.name)
      expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
    end

    it 'レビュー管理ページへのリンクが正しくされていること' do
      within("div.admin_position") do
        click_on "レビュー管理"
        expect(current_path).to eq comments_path
      end
      expect(page).to have_content("レビュー管理ページ")
      expect(page).to have_content(drama.name)
      expect(page).to have_selector("img,[src$='#{drama.image.filename}']")
      drama.comments.each{|comment|
        expect(page).to have_content(comment.user.name)
      }
      expect(page).to have_content(general.name)
      expect(page).to have_content(general.name)
    end
  end

end

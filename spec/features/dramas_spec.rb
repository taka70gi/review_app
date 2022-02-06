require 'rails_helper'

feature 'drama', type: :feature do
  describe "index" do
    given!(:general) { create :user, :general }
    given!(:drama) { create(:drama) }

    before do
      sign_in general
      get dramas_path
    end

    it 'ページタイトルが表示されること' do
      within("div.page-title") do
        expect(page).to have_content(taxon.name)
      end
    end
  end
end

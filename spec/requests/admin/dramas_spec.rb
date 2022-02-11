require 'rails_helper'

RSpec.describe "Admin::Dramas", type: :request do
  describe "index" do
    let!(:admin) { create :user, :admin }
    let!(:drama) { create(:drama) }

    before do
      sign_in admin
      get admin_dramas_path
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディに登録ドラマのタイトルが存在するか' do
        expect(response.body).to include drama.name
    end
  end

  describe "new" do
    let!(:admin) { create :user, :admin }

    before do
      sign_in admin
      get new_admin_drama_path
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end
  end

  describe "edit" do
    let!(:admin) { create :user, :admin }
    let!(:drama) { create(:drama) }

    before do
      sign_in admin
      get edit_admin_drama_path(drama)
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディに登録ドラマのタイトルが存在するか' do
      expect(response.body).to include drama.name
    end

    it 'レスポンスボディに登録ドラマの出演者が存在するか' do
      expect(response.body).to include drama.cast
    end

    it 'レスポンスボディに登録ドラマの公開年が存在するか' do
      expect(response.body).to include drama.release_day.to_s
    end

    it 'レスポンスボディに登録ドラマのあらすじが存在するか' do
      expect(response.body).to include drama.summary
    end
  end
end

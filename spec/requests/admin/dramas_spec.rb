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

    it 'レスポンスボディに管理者画面情報が存在するか' do
      expect(response.body).to include "ドラマ管理ページ"
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

    it 'レスポンスボディに管理者画面情報が存在するか' do
      expect(response.body).to include "ドラマ新規登録"
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

    it 'レスポンスボディに管理者画面情報が存在するか' do
      expect(response.body).to include "ドラマ更新"
      expect(response.body).to include drama.name
    end
  end
end

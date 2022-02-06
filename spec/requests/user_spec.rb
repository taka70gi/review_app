require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "index" do
    let!(:general) { create :user, :general }

    before do
      sign_in general
      get users_path
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディにドラマ一覧情報が存在するか' do
      expect(response.body).to include "マイページ"
    end
  end

  describe "edit" do
    let!(:general) { create :user, :general }

    before do
      sign_in general
      get edit_user_path(general)
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディに管理者画面情報が存在するか' do
      expect(response.body).to include "プロフィール編集"
    end
  end
end

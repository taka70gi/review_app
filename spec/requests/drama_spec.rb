require 'rails_helper'

RSpec.describe "Dramas", type: :request do
  describe "index" do
    let!(:general) { create :user, :general }
    let!(:drama) { create(:drama) }

    before do
      sign_in general
      get dramas_path
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディにドラマ一覧情報が存在するか' do
      expect(response.body).to include drama.name
    end
  end

  describe "search" do
    before do
      get "/dramas/search"
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディに管理者画面情報が存在するか' do
      expect(response.body).to include "検索結果:"
    end
  end

  describe "show" do
    let!(:general) { create :user, :general }
    let!(:drama) { create(:drama) }

    before do
      sign_in general
      get drama_path(drama)
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディに管理者画面情報が存在するか' do
      expect(response.body).to include drama.name
      expect(response.body).to include drama.summary
      expect(response.body).to include drama.cast
      expect(response.body).to include drama.release_day.to_s
    end
  end
end

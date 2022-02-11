require 'rails_helper'

RSpec.describe "Dramas", type: :request do
  describe "index" do
    let!(:drama) { create(:drama) }

    before do
      get dramas_path
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディに登録ドラマのタイトルが存在するか' do
      expect(response.body).to include drama.name
    end
  end

  describe "search" do
    let!(:drama) { create(:drama) }

    before do
      get "/dramas/search"
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディに登録ドラマのタイトルが存在するか' do
      expect(response.body).to include drama.name
    end
  end

  describe "show" do
    let!(:drama) { create(:drama) }

    before do
      get drama_path(drama)
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

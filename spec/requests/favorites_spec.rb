require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  describe "create" do
    let!(:general) { create :user, :general }
    let!(:drama) { create(:drama) }
    before do
      sign_in general
    end

    it 'レスポンスのステータスコードが302であること' do
      post drama_favorites_path(drama)
      expect(response.status).to eq 302
    end

    it 'お気に入りが登録されること' do
      expect do
        post drama_favorites_path(drama)
      end.to change(Favorite, :count).by(1)
    end

    it 'お気に入りが登録後ドラマ詳細画面へリダイレクトすること' do
      post drama_favorites_path(drama)
      expect(response).to redirect_to drama_path(drama)
    end
  end

  describe "delete" do
    let!(:general) { create :user, :general }
    let!(:drama) { create(:drama) }
    before do
      sign_in general
    end

    it 'レスポンスのステータスコードが302であること' do
      delete drama_favorites_path(drama)
      expect(response.status).to eq 302
    end

    it 'お気に入りが解除されること' do
      expect do
        #お気に入り登録後、削除し個数の変化を確認
        post drama_favorites_path(drama)
        delete drama_favorites_path(drama)
      end.to change(Favorite, :count).by(0)
    end

    it 'お気に入りが登録後ドラマ詳細画面へリダイレクトすること' do
      delete drama_favorites_path(drama)
      expect(response).to redirect_to drama_path(drama)
    end
  end
end

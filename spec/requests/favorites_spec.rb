require "rails_helper"

RSpec.describe "Favorites", type: :request do
  describe "create" do
    let!(:general) { create :user, :general }
    let!(:drama) { create(:drama) }
    before do
      sign_in general
    end

    it "レスポンスのステータスコードが200であること" do
      post drama_favorites_path(drama), xhr: true
      expect(response.status).to eq 200
    end

    it "お気に入りが登録されること" do
      expect do
        post drama_favorites_path(drama), xhr: true
      end.to change(Favorite, :count).by(1)
    end
  end

  describe "delete" do
    let!(:general) { create :user, :general }
    let!(:drama) { create(:drama) }
    before do
      sign_in general
    end

    it "レスポンスのステータスコードが200であること" do
      post drama_favorites_path(drama), xhr: true
      delete drama_favorites_path(drama), xhr: true
      expect(response.status).to eq 200
    end

    it "お気に入りが解除されること" do
      expect do
        post drama_favorites_path(drama), xhr: true
        delete drama_favorites_path(drama), xhr: true
      end.to change(Favorite, :count).by(0)
    end
  end
end

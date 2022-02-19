require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe "create" do
    let!(:general) { create :user, :general }
    let!(:drama) { create :drama }
    let!(:comment) { create(:comment, drama_id: drama.id) }
    before do
      sign_in general
    end

    it 'レスポンスのステータスコードが200であること' do
      post comment_likes_path(comment, dramaid: drama.id), xhr: true
      expect(response.status).to eq 200
    end

    it 'いいねが登録されること' do
      expect do
        post comment_likes_path(comment, dramaid: drama.id), xhr: true
      end.to change(Like, :count).by(1)
    end
  end

  describe "delete" do
    let!(:general) { create :user, :general }
    let!(:drama) { create :drama }
    let!(:comment) { create(:comment, drama_id: drama.id) }
    before do
      sign_in general
    end

    it 'レスポンスのステータスコードが200であること' do
      post comment_likes_path(comment, dramaid: drama.id), xhr: true
      delete comment_likes_path(comment, dramaid: drama.id), xhr: true
      expect(response.status).to eq 200
    end

    it 'いいねが解除されること' do
      expect do
        post comment_likes_path(comment, dramaid: drama.id), xhr: true
        delete comment_likes_path(comment, dramaid: drama.id), xhr: true
      end.to change(Like, :count).by(0)
    end
  end
end

require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "index" do
    let!(:general) { create :user, :general }
    let!(:comment) { create(:comment) }
    let!(:favorite) { create(:favorite) }
    before do
      sign_in general
      general.comments << comment
      general.favorites << favorite
      get users_path
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディにログインユーザー名が存在するか' do
      expect(response.body).to include general.name
    end

    it 'レスポンスボディにログインユーザーのプロフィールが存在するか' do
      expect(response.body).to include general.profile
    end

    it 'レスポンスボディにログインユーザーのレビューが存在するか' do
      general.comments.each{|general_comment|
        expect(response.body).to include general_comment.content
      }
    end

    it 'レスポンスボディにログインユーザーのお気に入りドラマが存在するか' do
      expect(response.body).to include favorite.drama.name
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

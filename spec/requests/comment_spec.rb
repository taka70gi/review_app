require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "index" do
    let!(:admin) { create :user, :admin }
    let!(:comment) { create(:comment) }

    before do
      sign_in admin
      get comments_path
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディに登録ドラマのタイトルが存在するか' do
      expect(response.body).to include comment.drama.name
    end

    it 'レスポンスボディにレビュー内容が存在するか' do
      expect(response.body).to include comment.content
    end

    it 'レスポンスボディにレビューしたユーザー名が存在するか' do
      expect(response.body).to include comment.user.name
    end
  end

  describe "new" do
    let!(:general) { create :user, :general }
    let!(:drama) { create(:drama) }

    before do
      sign_in general
      get new_comment_path(id: drama.id)
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディに登録ドラマのタイトルが存在するか' do
      expect(response.body).to include drama.name
    end
  end

  describe "edit" do
    let!(:general) { create :user, :general }
    let!(:comment) { create(:comment) }

    before do
      sign_in general
      get edit_comment_path(comment)
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディに登録ドラマのタイトルが存在するか' do
      expect(response.body).to include comment.drama.name
    end

    it 'レスポンスボディにレビュー内容が存在するか' do
      expect(response.body).to include comment.content
    end
  end
end

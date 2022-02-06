require 'rails_helper'

RSpec.describe "Comments", type: :request do
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

    it 'レスポンスボディにドラマ情報が存在するか' do
      expect(response.body).to include drama.name
    end
  end

  describe "edit" do
    let!(:general) { create :user, :general }
    let!(:drama) { create(:drama) }
    let!(:comment) { create(:comment) }

    before do
      sign_in general
      get edit_comment_path(comment)
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディにレビュー情報が存在するか' do
      expect(response.body).to include comment.content
    end
  end
end
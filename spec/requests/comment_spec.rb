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

  describe "create" do
    let!(:general) { create :user, :general }
    let!(:comment) { create(:comment) }

    before do
      sign_in general
    end
    context 'パラメータが妥当な場合' do
      it 'レスポンスのステータスコードが302であるか' do
        post comments_path, params: { comment: {content: comment.content, user_id: comment.user_id, drama_id: comment.drama_id }}
        expect(response.status).to eq 302
      end

      it 'レビューが登録されるか' do
        expect do
          post comments_path, params: { comment: {content: comment.content, user_id: comment.user_id, drama_id: comment.drama_id }}
        end.to change(Comment, :count).by(1)
      end

      it 'レビュー登録後ドラマ詳細画面へリダイレクトするか' do
        post comments_path, params: { comment: {content: comment.content, user_id: comment.user_id, drama_id: comment.drama_id }}
        expect(response).to redirect_to drama_path(comment.drama)
      end
    end

    context 'パラメータが不正な場合' do
      it 'レスポンスのステータスコードが200であるか' do
        post comments_path, params: { comment: {user_id: comment.user_id, drama_id: comment.drama_id }}
        expect(response.status).to eq 200
      end

      it 'レビューが登録されないか' do
        expect do
          post comments_path, params: { comment: {user_id: comment.user_id, drama_id: comment.drama_id }}
        end.to change(Comment, :count).by(0)
      end

      it 'editテンプレートで表示されるか' do
        post comments_path, params: { comment: {user_id: comment.user_id, drama_id: comment.drama_id }}
        expect(response).to render_template :edit
      end

      it '”レビューを投稿できませんでした”のエラーが表示されること' do
        patch comment_path(comment), params: { comment: {content: "", user_id: comment.user_id }}
        expect(response.body).to include "レビューを更新できませんでした"
      end
    end
  end

  describe "update" do
    let!(:general) { create :user, :general }
    let!(:comment) { create(:comment) }
    before do
      sign_in general
    end

    context 'パラメータが妥当な場合' do
      it 'レスポンスのステータスコードが302であるか' do
        patch comment_path(comment), params: { comment: {content: "アップデート", user_id: comment.user_id, drama_id: comment.drama_id }}
        expect(response.status).to eq 302
      end

      it 'レビュー内容が更新されること' do
        expect do
          patch comment_path(comment), params: { comment: {content: "アップデート", user_id: comment.user_id, drama_id: comment.drama_id }}
        end.to change { Comment.find(comment.id).content }.from("テストデータ").to("アップデート")
      end

      it 'マイページへリダイレクトすること' do
        patch comment_path(comment), params: { comment: {content: "アップデート", user_id: comment.user_id, drama_id: comment.drama_id }}
        expect(response).to redirect_to users_path
      end
    end

    context 'パラメータが不正な場合' do
      it 'レスポンスのステータスコードが200であるか' do
        patch comment_path(comment), params: { comment: {content: "", user_id: comment.user_id }}
        expect(response.status).to eq 200
      end

      it 'レビュー内容が更新されないこと' do
        expect do
          patch comment_path(comment), params: { comment: {content: "", user_id: comment.user_id }}
        end.to_not change(Comment.find(comment.id), :content)
      end

      it 'editテンプレートで表示されるか' do
        patch comment_path(comment), params: { comment: {content: "", user_id: comment.user_id }}
        expect(response).to render_template :edit
      end

      it '”レビューを更新できませんでした”のエラーが表示されること' do
        patch comment_path(comment), params: { comment: {content: "", user_id: comment.user_id }}
        expect(response.body).to include "レビューを更新できませんでした"
      end
    end
  end

  describe "delete" do
    let!(:general) { create :user, :general }
    let!(:comment) { create(:comment) }
    before do
      sign_in general
    end

    it 'レスポンスのステータスコードが302であるか' do
      delete comment_path(comment)
      expect(response.status).to eq 302
    end

    it 'レビューが削除されること' do
      expect do
        delete comment_path(comment)
      end.to change(Comment, :count).by(-1)
    end

    it 'マイページにリダイレクトすること' do
      delete comment_path(comment)
      expect(response).to redirect_to(users_path)
    end
  end
end

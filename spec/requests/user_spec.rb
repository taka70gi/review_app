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

    it 'レスポンスのステータスコードが200であること' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディにログインユーザー名が存在すること' do
      expect(response.body).to include general.name
    end

    it 'レスポンスボディにログインユーザーのプロフィールが存在すること' do
      expect(response.body).to include general.profile
    end

    it 'レスポンスボディにログインユーザーのレビューが存在すること' do
      general.comments.each{|general_comment|
        expect(response.body).to include general_comment.content
      }
    end

    it 'レスポンスボディにログインユーザーのお気に入りドラマが存在すること' do
      expect(response.body).to include favorite.drama.name
    end
  end

  describe "edit" do
    let!(:general) { create :user, :general }
    before do
      sign_in general
      get edit_user_path(general)
    end

    it 'レスポンスのステータスコードが200であること' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディにユーザー名が存在すること' do
      expect(response.body).to include general.name
    end

    it 'レスポンスボディにユーザー自己紹介が存在すること' do
      expect(response.body).to include general.profile
    end
  end

  describe "update" do
    let!(:general) { create :user, :general }
    before do
      sign_in general
    end
    context 'パラメータが妥当な場合' do
      it 'レスポンスのステータスコードが302であること' do
        user_params = FactoryBot.attributes_for(:user, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "アップデート")
        patch user_path(general), params: { user: user_params }
        expect(response.status).to eq 302
      end

      it 'ユーザー名が更新されること' do
        expect do
          user_params = FactoryBot.attributes_for(:user, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "アップデート")
          patch user_path(general), params: { user: user_params }
        end.to change { User.find(general.id).name }.from(general.name).to("アップデート")
      end

      it 'マイページへリダイレクトすること' do
        user_params = FactoryBot.attributes_for(:user, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "アップデート")
        patch user_path(general), params: { user: user_params }
        expect(response).to redirect_to users_path
      end
    end

    context 'パラメータが不正な場合' do
      it 'レスポンスのステータスコードが200であること' do
        user_params = FactoryBot.attributes_for(:user, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "")
        patch user_path(general), params: { user: user_params }
        expect(response.status).to eq 200
      end

      it 'ユーザー名が更新されないこと' do
        expect do
          user_params = FactoryBot.attributes_for(:user, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "")
          patch user_path(general), params: { user: user_params }
        end.to_not change(User.find(general.id), :name)
      end

      it 'editテンプレートで表示されること' do
        user_params = FactoryBot.attributes_for(:user, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "")
        patch user_path(general), params: { user: user_params }
        expect(response).to render_template :edit
      end

      it '”ユーザー名を更新できませんでした”のエラーが表示されること' do
        user_params = FactoryBot.attributes_for(:user, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "")
        patch user_path(general), params: { user: user_params }
        expect(response.body).to include "プロフィールを更新できませんでした"
      end
    end
  end
end

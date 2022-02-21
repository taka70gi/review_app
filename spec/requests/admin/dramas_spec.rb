require "rails_helper"

RSpec.describe "Admin::Dramas", type: :request do
  describe "index" do
    let!(:admin) { create :user, :admin }
    let!(:drama) { create(:drama) }

    before do
      sign_in admin
      get admin_dramas_path
    end

    it "レスポンスのステータスコードが200であること" do
      expect(response.status).to eq 200
    end

    it "レスポンスボディに登録ドラマのタイトルが存在すること" do
      expect(response.body).to include drama.name
    end
  end

  describe "new" do
    let!(:admin) { create :user, :admin }

    before do
      sign_in admin
      get new_admin_drama_path
    end

    it "レスポンスのステータスコードが200であること" do
      expect(response.status).to eq 200
    end
  end

  describe "edit" do
    let!(:admin) { create :user, :admin }
    let!(:drama) { create(:drama) }

    before do
      sign_in admin
      get edit_admin_drama_path(drama)
    end

    it "レスポンスのステータスコードが200であること" do
      expect(response.status).to eq 200
    end

    it "レスポンスボディに登録ドラマのタイトルが存在すること" do
      expect(response.body).to include drama.name
    end

    it "レスポンスボディに登録ドラマの出演者が存在すること" do
      expect(response.body).to include drama.cast
    end

    it "レスポンスボディに登録ドラマの公開年が存在すること" do
      expect(response.body).to include drama.release_day.to_s
    end

    it "レスポンスボディに登録ドラマのあらすじが存在すること" do
      expect(response.body).to include drama.summary
    end
  end

  describe "create" do
    let!(:admin) { create :user, :admin }
    let!(:drama) { create(:drama) }

    before do
      sign_in admin
    end

    context "パラメータが妥当な場合" do
      it "レスポンスのステータスコードが302であること" do
        drama_params = FactoryBot.attributes_for(:drama, image: fixture_file_upload("spec/fixtures/files/star_img.png"))
        post admin_dramas_path, params: { drama: drama_params }
        expect(response.status).to eq 302
      end

      it "ドラマが登録されること" do
        expect do
          drama_params = FactoryBot.attributes_for(:drama, image: fixture_file_upload("spec/fixtures/files/star_img.png"))
          post admin_dramas_path, params: { drama: drama_params }
        end.to change(Drama, :count).by(1)
      end

      it "レビュー登録後ドラマ詳細画面へリダイレクトすること" do
        drama_params = FactoryBot.attributes_for(:drama, image: fixture_file_upload("spec/fixtures/files/star_img.png"))
        post admin_dramas_path, params: { drama: drama_params }
        expect(response).to redirect_to admin_dramas_path
      end
    end

    context "パラメータが不正な場合" do
      it "レスポンスのステータスコードが200であること" do
        drama_params = FactoryBot.attributes_for(:drama)
        post admin_dramas_path, params: { drama: drama_params }
        expect(response.status).to eq 200
      end

      it "ドラマが登録されないこと" do
        expect do
          drama_params = FactoryBot.attributes_for(:drama)
          post admin_dramas_path, params: { drama: drama_params }
        end.to change(Drama, :count).by(0)
      end

      it "newテンプレートで表示されること" do
        drama_params = FactoryBot.attributes_for(:drama)
        post admin_dramas_path, params: { drama: drama_params }
        expect(response).to render_template :new
      end

      it "”レビューを投稿できませんでした”のエラーが表示されること" do
        drama_params = FactoryBot.attributes_for(:drama)
        post admin_dramas_path, params: { drama: drama_params }
        expect(response.body).to include "ドラマを登録できませんでした"
      end
    end
  end

  describe "update" do
    let!(:admin) { create :user, :admin }
    let!(:drama) { create(:drama) }

    before do
      sign_in admin
    end

    context "パラメータが妥当な場合" do
      it "レスポンスのステータスコードが302であること" do
        drama_params = FactoryBot.attributes_for(:drama, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "アップデート")
        patch admin_drama_path(drama), params: { drama: drama_params }
        expect(response.status).to eq 302
      end

      it "ドラマタイトルが更新されること" do
        expect do
          drama_params = FactoryBot.attributes_for(:drama, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "アップデート")
          patch admin_drama_path(drama), params: { drama: drama_params }
        end.to change { Drama.find(drama.id).name }.from(drama.name).to("アップデート")
      end

      it "ドラマ管理ページへリダイレクトすること" do
        drama_params = FactoryBot.attributes_for(:drama, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "アップデート")
        patch admin_drama_path(drama), params: { drama: drama_params }
        expect(response).to redirect_to admin_dramas_path
      end
    end

    context "パラメータが不正な場合" do
      it "レスポンスのステータスコードが200であること" do
        drama_params = FactoryBot.attributes_for(:drama, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "")
        patch admin_drama_path(drama), params: { drama: drama_params }
        expect(response.status).to eq 200
      end

      it "ドラマタイトルが更新されないこと" do
        expect do
          drama_params = FactoryBot.attributes_for(:drama, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "")
          patch admin_drama_path(drama), params: { drama: drama_params }
        end.to_not change(Drama.find(drama.id), :name)
      end

      it "editテンプレートで表示されること" do
        drama_params = FactoryBot.attributes_for(:drama, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "")
        patch admin_drama_path(drama), params: { drama: drama_params }
        expect(response).to render_template :edit
      end

      it "”レビューを更新できませんでした”のエラーが表示されること" do
        drama_params = FactoryBot.attributes_for(:drama, image: fixture_file_upload("spec/fixtures/files/star_img.png"), name: "")
        patch admin_drama_path(drama), params: { drama: drama_params }
        expect(response.body).to include "ドラマ登録内容を更新できませんでした"
      end
    end
  end

  describe "delete" do
    let!(:admin) { create :user, :admin }
    let!(:drama) { create(:drama) }

    before do
      sign_in admin
    end

    it "レスポンスのステータスコードが302であること" do
      delete admin_drama_path(drama)
      expect(response.status).to eq 302
    end

    it "ドラマが削除されること" do
      expect do
        delete admin_drama_path(drama)
      end.to change(Drama, :count).by(-1)
    end

    it "ドラマ管理ページへリダイレクトすること" do
      delete admin_drama_path(drama)
      expect(response).to redirect_to admin_dramas_path
    end
  end
end

require 'rails_helper'

RSpec.describe "Adminhomes", type: :request do
  describe "index" do
    let!(:admin) { create :user, :admin }
    let!(:drama) { create(:drama) }

    before do
      sign_in admin
      get adminhomes_path
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end

    it 'レスポンスボディにドラマ情報が存在するか' do
      expect(response.body).to include "管理者ページ"
      expect(response.body).to include "ドラマ管理"
      expect(response.body).to include "レビュー管理"
    end
  end

end

require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "index" do
    let!(:admin) { create :user, :admin }

    before do
      sign_in admin
      get homes_path
    end

    it 'レスポンスのステータスコードが200であるか' do
      expect(response.status).to eq 200
    end
  end
end

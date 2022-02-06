require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe "full_titleからタイトル取得", type: :helper do
    it 'タイトルが取得されること' do
      expect(full_title('test')).to eq("test - 韓ドラレビュー")
    end

    it '引数が空文字だった場合タイトルが取得されること' do
      expect(full_title('')).to eq("韓ドラレビュー")
    end

    it '引数がnilだった場合タイトルが取得されること' do
      expect(full_title(nil)).to eq("韓ドラレビュー")
    end
  end
end

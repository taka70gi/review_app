require 'rails_helper'

RSpec.describe "Comment", type: :model do
  let!(:general) { create :user, :general }
  let!(:drama) { create(:drama) }
  let!(:comment) { create(:comment) }

  it "全てのカラムが埋められた状態であれば、Commentモデルを作成できるか" do
    comment = Comment.new(
      content: "テストデータ",
      user_id: general.id,
      drama_id: drama.id,
    )
    expect(comment).to be_valid
  end

  describe 'バリデーション' do
    it '全ての値が設定されていれば、OK' do
      expect(comment.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      comment.content = ''
      expect(comment.valid?).to eq(false)
    end
  end
end

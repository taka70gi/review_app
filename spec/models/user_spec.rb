require "rails_helper"

RSpec.describe "User", type: :model do
  let!(:user) { create(:user) }

  it "全てのカラムが埋められた状態であれば、Userモデルを作成できるか" do
    user = User.new(
      email: "user1@user.com",
      password: "user1pass",
      name: "user1"
    )
    expect(user).to be_valid
  end

  describe "バリデーション" do
    it "nameとemailどちらも値が設定されていれば、OK" do
      expect(user.valid?).to eq(true)
    end

    it "nameが空だとNG" do
      user.name = ""
      expect(user.valid?).to eq(false)
    end

    it "emailが空だとNG" do
      user.email = ""
      expect(user.valid?).to eq(false)
    end

    it "passwordが空だとNG" do
      user.password = ""
      expect(user.valid?).to eq(false)
    end
  end
end

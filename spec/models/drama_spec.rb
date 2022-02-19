require 'rails_helper'

RSpec.describe "Drama", type: :model do
  let!(:drama) { create(:drama) }

  it "全てのカラムが埋められた状態であれば、Dramaモデルを作成できるか" do
    drama = Drama.new(
      name: "愛の不時着",
      summary: "パラグライダー中に思わぬ事故に巻き込まれ、北朝鮮に不時着してしまった韓国の財閥令嬢。そこで出会った堅物の将校の家で、身分を隠して暮らすことになるが...。",
      cast: "ヒョンビン、ソン・イェジン、ソ・ジヘ",
      release_day: 2019,
      image:  Rack::Test::UploadedFile.new("spec/fixtures/files/star_img.png", "image/jpg"),
    )
    expect(drama).to be_valid
  end

  describe 'バリデーション' do
    it '全ての値が設定されていれば、OK' do
      expect(drama.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      drama.name = ''
      expect(drama.valid?).to eq(false)
    end

    it 'summaryが空だとNG' do
      drama.summary = ''
      expect(drama.valid?).to eq(false)
    end

    it 'castが空だとNG' do
      drama.cast = ''
      expect(drama.valid?).to eq(false)
    end

    it 'release_dayが空だとNG' do
      drama.release_day = ''
      expect(drama.valid?).to eq(false)
    end

    it 'imageが空だとNG' do
      drama.image = nil
      expect(drama.valid?).to eq(false)
    end
  end
end

FactoryBot.define do
  factory :drama do
    sequence(:name) { |n| "韓国ドラマタイトル#{n}" }
    summary { "不滅の命を持つ存在となった戦士は、900年以上の時を生きてきた。この呪縛から自分を解放できる花嫁だという女子高生や死神と出会い、数奇な運命が動き出す。" }
    cast { "コン・ユ、キム・ゴウン、イ・ドンウク" }
    release_day { 2016 }

    after(:build) do |drama|
      drama.image.attach(io: File.open(Rails.root.join("spec/fixtures/files/star_img.png")), filename: "star_img.png")
    end
  end
end

FactoryBot.define do
  factory :drama do
    sequence :name do |n|
      "韓国ドラマタイトル#{n}"
    end
    summary{ "不滅の命を持つ存在となった戦士は、900年以上の時を生きてきた。この呪縛から自分を解放できる花嫁だという女子高生や死神と出会い、数奇な運命が動き出す。" }
    cast{ "コン・ユ、キム・ゴウン、イ・ドンウク" }
    release_day{ 2016 }
    image { Rack::Test::UploadedFile.new("spec/fixtures/star.png", "image/jpg") }
  end
end

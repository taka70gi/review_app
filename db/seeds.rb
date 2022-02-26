# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "管理者",
  email: "admin@example.jp",
  password: "administrator",
  password_confirmation: "administrator",
  admin: true)

user = User.create!(
  name: "ゲスト",
  email: "guest@example.jp",
  password: "password",
  password_confirmation: "password",
  admin: false
)
user.image.attach(io: File.open(Rails.root.join("db/fixtures/icon/animal_buta.png")), filename: "animal_buta.png")

user01 = User.create!(
  name: "なお",
  email: "test1@example.jp",
  password: "test1user",
  password_confirmation: "test1user",
  admin: false
)
user01.image.attach(io: File.open(Rails.root.join("db/fixtures/icon/dog.png")), filename: "dog.png")

user02 = User.create!(
  name: "はなこ",
  email: "test2@example.jp",
  password: "test2user",
  password_confirmation: "test2user",
  admin: false
)
user02.image.attach(io: File.open(Rails.root.join("db/fixtures/icon/woman1.png")), filename: "woman1.png")

user03 = User.create!(
  name: "たろう",
  email: "test3@example.jp",
  password: "test3user",
  password_confirmation: "test3user",
  admin: false
)
user03.image.attach(io: File.open(Rails.root.join("db/fixtures/icon/dog.png")), filename: "dog.png")

user04 = User.create!(
  name: "むぎ",
  email: "test4@example.jp",
  password: "test4user",
  password_confirmation: "test4user",
  admin: false
)
user04.image.attach(io: File.open(Rails.root.join("db/fixtures/icon/kuma.png")), filename: "kuma.png")

user05 = User.create!(
  name: "かすみ",
  email: "test5@example.jp",
  password: "test5user",
  password_confirmation: "test5user",
  admin: false
)
user05.image.attach(io: File.open(Rails.root.join("db/fixtures/icon/fashion_dekora.png")), filename: "fashion_dekora.png")

user06 = User.create!(
  name: "なな",
  email: "test6@example.jp",
  password: "test6user",
  password_confirmation: "test6user",
  admin: false
)
user06.image.attach(io: File.open(Rails.root.join("db/fixtures/icon/woman2.jpeg")), filename: "animal_buta.png")

user07 = User.create!(
  name: "ぽぽ",
  email: "test7@example.jp",
  password: "test7user",
  password_confirmation: "test7user",
  admin: false
)
user07.image.attach(io: File.open(Rails.root.join("db/fixtures/icon/uma.png")), filename: "uma.png")

user08 = User.create!(
  name: "きのこ",
  email: "test8@example.jp",
  password: "test8user",
  password_confirmation: "test8user",
  admin: false
)
user08.image.attach(io: File.open(Rails.root.join("db/fixtures/icon/small_star7_yellow.png")), filename: "small_star7_yellow.png")

user09 = User.create!(
  name: "たいが",
  email: "test9@example.jp",
  password: "test9user",
  password_confirmation: "test9user",
  admin: false
)
user09.image.attach(io: File.open(Rails.root.join("db/fixtures/icon/tora.png")), filename: "tora.png")

user10 = User.create!(
  name: "くろめ",
  email: "test10@example.jp",
  password: "test10user",
  password_confirmation: "test10user",
  admin: false
)
user10.image.attach(io: File.open(Rails.root.join("db/fixtures/icon/panda.jpeg")), filename: "small_star7_yellow.png")

Drama.create!(
  name: "太陽の末裔",
  release_day: 2016,
  summary: "「太陽の末裔」の舞台は、韓国から離れた危険な紛争地域。韓国で1度出会い、接近したもののすれ違ってしまった2人が、スリリングな環境に派遣された軍人と女医として紛争地域で運命の再開を果たす。そして惹かれ合い愛を育んでいくという、ドラマチックなラブストーリー。",
  cast: "ソン・ジュンギ、ソン・ヘギョ、チン・グ、キム・ジウォン",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/太陽の末裔.jpeg")), filename: "太陽の末裔.jpeg")
)
Drama.create!(
  name: "あやしいパートナー ～Destiny Lovers～",
  release_day: 2017,
  summary: "不思議な縁で知り合った、敏腕検事とキュートな司法修習生。2人の出会いは運命かと思いきや、彼女が突然殺人事件の容疑者になり、彼の人生も一変してしまう。",
  cast: "チ・チャンウク、ナム・ジヒョン、チェ・テジュン",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/あやしいパートナー.jpeg")), filename: "あやしいパートナー.jpeg")
)
Drama.create!(
  name: "ボーイフレンド",
  release_day: 2018,
  summary: "裕福に生まれながらも窮屈な人生を歩んできた女性と、平凡な家庭で育った自由な青年。異国の地で偶然出会った2人が、ホテルの代表と従業員として再会を果たす。",
  cast: "ソン・ヘギョ、パク・ボゴム、チャン・スンジョ",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/ボーイフレンド.jpeg")), filename: "ボーイフレンド.jpeg")
)
Drama.create!(
  name: "梨泰院クラス",
  release_day: 2020,
  summary: "大都市ソウルの中でもひと際ホットな街で、小さな飲み屋を開店させた前科者の青年とその仲間たち。成功をつかむため、大物相手に無謀ともいえる戦いを仕掛ける。",
  cast: "パク・ソジュン、キム・ダミ、ユ・ジェミョン",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/梨泰院クラス.jpeg")), filename: "梨泰院クラス.jpeg")
)
Drama.create!(
  name: "スタートアップ: 夢の扉",
  release_day: 2020,
  summary: "競争の激しい韓国のハイテク業界で、夢をかなえるべくビジネスを立ち上げた若き起業家たち。成功もロマンスも、すべてを手に入れるには前進あるのみ。",
  cast: "ペ・スジ、ナム・ジュヒョク、キム・ソンホ",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/スタートアップ.jpg")), filename: "スタートアップ.jpg")
)
Drama.create!(
  name: "ヴィンチェンツォ",
  release_day: 2021,
  summary: "マフィアの顧問を務める韓国系イタリア人の弁護士が、母国韓国で繰り広げる壮絶な戦い。その目的は、ばく大な富と利権を握る巨大組織に正義の鉄ついを下すこと。",
  cast: "ソン・ジュンギ、チョン・ヨビン、テギョン",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/ヴィンチェンツォ.jpg")), filename: "ヴィンチェンツォ.jpg")
)
Drama.create!(
  name: "わかっていても",
  release_day: 2021,
  summary: "恋愛は面倒だけどトキメキは楽しみたいイケメン男子と、愛なんて信じないけど恋愛はしたい女子。同じ学校に通う2人は、互いに割り切った関係を始めることに。",
  cast: "ソン・ガン、ハン・ソヒ、チェ・ジョンヒョプ",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/わかっていても.jpeg")), filename: "わかっていても.jpeg")
)
Drama.create!(
  name: "その年、私たちは",
  release_day: 2021,
  summary: "高校時代に撮影したドキュメンタリーが人気を集めたことで、10年ぶりにカメラの前に立った元恋人同士の2人。もう二度と会いたくないと思っていたのに...。",
  cast: "チェ・ウシク、キム・ダミ、キム・ソンチョル",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/その年私たちは.jpg")), filename: "その年私たちは.jpg")
)
Drama.create!(
  name: "マイネーム: 偽りと復讐",
  release_day: 2021,
  summary: "自分のすぐそばで命を奪われた父。たとえどんな代償を払うことになろうとも必ず仇(かたき)を討つと誓った娘は、犯罪組織のボスの後ろ盾を受け、警察へと潜入する。",
  cast: "ハン・ソヒ、パク・ヒスン、アン・ボヒョン",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/マイネーム.jpg")), filename: "マイネーム.jpg")
)
Drama.create!(
  name: "イカゲーム",
  release_day: 2021,
  summary: "勝てば天国、負ければ…即死。賞金に目がくらみ、奇妙なゲームへの招待を受けた参加者たちを待っていたのは、昔ながらの遊びを取り入れた死のゲームだった。",
  cast: "イ・ジョンジェ、パク・ヘス、ウィ・ハジュン",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/イカゲーム.jpg")), filename: "イカゲーム.jpg")
)
Drama.create!(
  name: "青春の記録",
  release_day: 2020,
  summary: "俳優としての成功を夢見る2人の青年と、メイクアップアーティストの卵。生まれや家柄が重要視されるこの世界で、自分の力だけで夢に挑む若者たちの青春を描く。",
  cast: "パク・ボゴム、パク・ソダム、ピョン・ウソク",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/青春の記録.jpg")), filename: "青春の記録.jpg")
)
Drama.create!(
  name: "海街チャチャチャ",
  release_day: 2021,
  summary: "都会を離れ、海辺の町で開業した歯科医と、できないことなど何もない'万能ニート'の青年。すべてにおいて正反対な2人は、何かにつけて衝突してばかりで...。",
  cast: "シン・ミナ、キム・ソンホ、イ・サンイ",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/海街チャチャチャ.jpg")), filename: "海街チャチャチャ.jpg")
)
Drama.create!(
  name: "地獄が呼んでいる",
  release_day: 2021,
  summary: "この世のものではない'何か'が突然現れ、人間たちを地獄へと突き落とす...。人々が恐怖におののく中、この現象を神の裁きだと主張する宗教団体が台頭し始める。",
  cast: "ユ・アイン、キム・ヒョンジュ、パク・ジョンミン",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/地獄が呼んでいる.jpg")), filename: "地獄が呼んでいる.jpg")
)
Drama.create!(
  name: "ただ愛する仲",
  release_day: 2017,
  summary: "建物の倒壊事故から奇跡的に生還した男女。家族を失った悲しみを乗り越え、未来への希望を取り戻そうとする2人が、互いの心の傷を癒やしながら愛を育んでゆく。",
  cast: "ジュノ、ウォン・ジナ、イ・ギウ",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/ただ愛する仲.jpg")), filename: "ただ愛する仲.jpg")
)
Drama.create!(
  name: "ヒーラー〜最高の恋人〜",
  release_day: 2014,
  summary: "レジェンド級の使者「ヒーラー」、ソ・ジョンフ（チ・チャンウク）は今日も新しい依頼を遂行していてライバルと激戦を繰り広げる。 スター記者のキム・ムンホ（ユ・ジテ）は、生放送中に再び事故を起こし、B級のインターネット新聞芸能部記者であるヨンシン（パク・ミニョン）は今日もスクープを夢見てスターを追いかける。 ソ・ジョンフが受けた次のミッションのターゲットは、まさにそのチェ・ヨンシン。 その依頼人はキム・ムンホだった・・・",
  cast: "チ・チャンウク、ユ・ジテ、パク・ミニョン、ト・ジウォン",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/ヒーラー.jpg")), filename: "ヒーラー.jpg")
)
Drama.create!(
  name: "悪霊狩猟団: カウンターズ",
  release_day: 2020,
  summary: "昼は麺物屋の従業員、夜は悪霊と戦う正義の味方。特別な力を与えられたカウンターたちは、今日も命がけの戦いに挑む。この世の平和と、大切な人たちを守るため。",
  cast: "チョ・ビョンギュ、ユ・ジュンサン、キム・セジョン",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/カウンターズ.jpg")), filename: "カウンターズ.jpg")
)
Drama.create!(
  name: "都会の男女の恋愛法",
  release_day: 2020,
  summary: "海のそばで出会った、束の間の恋の相手。その自由奔放な魅力にすっかり心奪われた建築家は、多くの人が行き交う大都市ソウルで、彼女との再会を願うが...。",
  cast: "チ・チャンウク、キム・ジウォン、キム・ミンソク",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/都会の男女の恋愛法.jpg")), filename: "都会の男女の恋愛法.jpg")
)
Drama.create!(
  name: "それでも僕らは走り続ける",
  release_day: 2020,
  summary: "決められたコースを走り続けてきた陸上界の有望選手。ひとりの翻訳家との出会いをきっかけに、初めて自分のペースで、心のままに人生を走り始める。",
  cast: "イム・シワン、シン・セギョン、チェ・スヨン",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/それでも僕らは走り続ける.jpg")), filename: "それでも僕らは走り続ける.jpg")
)
Drama.create!(
  name: "ロマンスは別冊付録",
  release_day: 2019,
  summary: "記録的な若さで編集長の座についた天才作家と、どうしても仕事が欲しい元人気コピーライター。出版社の中でつづられるのは、どんな小説よりも甘く切ない恋物語。",
  cast: "イ・ジョンソク、イ・ナヨン、チョン・ユジン",
  image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/drama/ロマンスは別冊付録.jpg")), filename: "ロマンスは別冊付録.jpg")
)

Comment.create!(
  content: "韓国ドラマ史上一番好きなドラマです。OSTも大好きです。",
  user_id: 2,
  drama_id: 1
)
Comment.create!(
  content: "ソン・ジュンギ、ソン・ヘギョのペアが最高過ぎ。最後の３話めっちゃ泣きました！",
  user_id: 3,
  drama_id: 1
)
Comment.create!(
  content: "「自分でできることをやってあげるのが恋愛」の名台詞！OSTが最高過ぎ。",
  user_id: 4,
  drama_id: 1
)
Comment.create!(
  content: "みんなにおすすめしている韓国ドラマです。ビックボス最高！",
  user_id: 5,
  drama_id: 1
)
Comment.create!(
  content: "ソン・ジュンギ×ソン・ヘギョも良いけど、チン・グ×キム・ジウォンも好きです！キム・ジウォン可愛い・・・。",
  user_id: 6,
  drama_id: 1
)
Comment.create!(
  content: "話数は多いけど、ハマったら一瞬で見おわります！おすすめです。",
  user_id: 7,
  drama_id: 1
)
Comment.create!(
  content: "友達の紹介で見ました。Netflixでも公開してほしいなあ。",
  user_id: 8,
  drama_id: 1
)
Comment.create!(
  content: "最後、辛過ぎて展開を確認してから見ました。",
  user_id: 9,
  drama_id: 1
)
Comment.create!(
  content: "ラスト３話が面白い。",
  user_id: 10,
  drama_id: 1
)
Comment.create!(
  content: "ソンジュンギがかっこよすぎる。韓ドラおすすめ聞かれたらまずこれをおすすめする。",
  user_id: 11,
  drama_id: 1
)
Comment.create!(
  content: "U-NEXTに入ってやっと見れたー！キュンキュンで、泣ける・・。",
  user_id: 12,
  drama_id: 1
)

Comment.create!(
  content: "チチャンウク目当てで見ました。出ているキャストの顔面偏差値が高過ぎた！",
  user_id: 2,
  drama_id: 2
)
Comment.create!(
  content: "チチャンウクカッコ良い。",
  user_id: 3,
  drama_id: 2
)
Comment.create!(
  content: "中間で少し飽きてしまったけど、無事完走できました。",
  user_id: 4,
  drama_id: 2
)
Comment.create!(
  content: "恋愛だけでなく、事件も関わってくるので恋愛恋愛してなくてみやすいかも。",
  user_id: 5,
  drama_id: 2
)

Comment.create!(
  content: "とにかく映像が綺麗！キューバに行きたくなるドラマ！",
  user_id: 5,
  drama_id: 3
)
Comment.create!(
  content: "王道のラブコメディだけど先が気になって一気見しました！年下男子最高。",
  user_id: 6,
  drama_id: 3
)
Comment.create!(
  content: "ソン・ヘギョ綺麗すぎる。大好きな女優さんの一人になりました。",
  user_id: 7,
  drama_id: 3
)
Comment.create!(
  content: "パク・ボゴムと付き合いたい・・・。",
  user_id: 8,
  drama_id: 3
)
Comment.create!(
  content: "身分の違いも弾き飛ばすパク・ボゴム最強。",
  user_id: 9,
  drama_id: 3
)
Comment.create!(
  content: "仮面武道会のシーンが素敵すぎる。",
  user_id: 10,
  drama_id: 3
)

Comment.create!(
  content: "流行っていたので見ました。復讐ドラマ好きな人はぜひ見てください。",
  user_id: 2,
  drama_id: 4
)
Comment.create!(
  content: "梨泰院行ってみたくなりました！チョ・イソがすきです！",
  user_id: 3,
  drama_id: 4
)
Comment.create!(
  content: "チョ・イソ派です！ビンタしたところ面白かった。",
  user_id: 4,
  drama_id: 4
)
Comment.create!(
  content: "見終わってから、東京にあるタンバム行きました！お店の中でも見ました！！",
  user_id: 5,
  drama_id: 4
)
Comment.create!(
  content: "絶対スア派！！",
  user_id: 6,
  drama_id: 4
)

Comment.create!(
  content: "前向きになれるドラマです！明日からも頑張れそうです。",
  user_id: 7,
  drama_id: 5
)
Comment.create!(
  content: "ペ・スジが好きでみました！先日韓ドラ展も行ってきました！",
  user_id: 8,
  drama_id: 5
)

Comment.create!(
  content: "流行っていたので見ました。長くて途中で辞めちゃいました・・・。",
  user_id: 2,
  drama_id: 6
)

Comment.create!(
  content: "とにかくソン・ガンとハン・ソヒが良すぎる。内容は普通！",
  user_id: 2,
  drama_id: 7
)
Comment.create!(
  content: "ハン・ソヒ大好き！！！可愛すぎる！！ハン・ソヒ好きな人にはマイネームも見てほしい！",
  user_id: 3,
  drama_id: 7
)
Comment.create!(
  content: "すごい面白いわけではないけど完走しちゃいました。ゆるく見るのにはおすすめ！",
  user_id: 4,
  drama_id: 7
)
Comment.create!(
  content: "ストーリーが微妙。",
  user_id: 5,
  drama_id: 7
)

Comment.create!(
  content: "完走しました！ロスです・・。",
  user_id: 5,
  drama_id: 8
)
Comment.create!(
  content: "キム・ダミのツンデレが可愛すぎる。ただの恋愛ドラマじゃなくて環境とかも影響してくるから感情移入しやすい気がしました！",
  user_id: 6,
  drama_id: 8
)
Comment.create!(
  content: "三角関係つらすぎる・・。最後はハッピーエンドでよかった！！",
  user_id: 7,
  drama_id: 8
)
Comment.create!(
  content: "毎週楽しみに見てました！！ここ最近で一番面白かったドラマです！",
  user_id: 8,
  drama_id: 8
)

Comment.create!(
  content: "復讐系のドラマ！ハン・ソヒの演技がうま過ぎ。わかっていてもとは違った顔が見れます。",
  user_id: 2,
  drama_id: 9
)
Comment.create!(
  content: "ハン・ソヒ大好き！！！可愛すぎる！！",
  user_id: 3,
  drama_id: 9
)
Comment.create!(
  content: "一気に見ちゃいました。一回ハマったら最後まで一気に見ちゃう系のドラマです。",
  user_id: 4,
  drama_id: 9
)
Comment.create!(
  content: "短くて見やすいです。",
  user_id: 5,
  drama_id: 9
)

Comment.create!(
  content: "デスゲーム好きにおすすめ。",
  user_id: 11,
  drama_id: 10
)
Comment.create!(
  content: "日本のカイジみたい！",
  user_id: 12,
  drama_id: 10
)

Comment.create!(
  content: "完走しました！ロスです・・。パク・ボゴム好きです。",
  user_id: 5,
  drama_id: 11
)
Comment.create!(
  content: "パク・ボゴムが好きで見ました！ボーイフレンドとはまた違った良さがあります。",
  user_id: 6,
  drama_id: 11
)
Comment.create!(
  content: "ありがちなストーリー。",
  user_id: 7,
  drama_id: 11
)

Comment.create!(
  content: "スタートアップでキム・ソンホが好きになってこちらも見ました。おもしろかったです。",
  user_id: 8,
  drama_id: 12
)
Comment.create!(
  content: "毎週楽しみに見てました！！最後３話泣きました。",
  user_id: 9,
  drama_id: 12
)
Comment.create!(
  content: "街の人との絡みもゆるくて好きです。最後は泣けます。ロスになりました・・。",
  user_id: 10,
  drama_id: 12
)

Comment.create!(
  content: "やじりがよくわからなかった。あんまり面白くないかも・・・。",
  user_id: 2,
  drama_id: 13
)
Comment.create!(
  content: "ラストはよくわからなかった。",
  user_id: 3,
  drama_id: 13
)
Comment.create!(
  content: "よくわからなかった・・・。",
  user_id: 4,
  drama_id: 13
)
Comment.create!(
  content: "あのゴリラはなんだったのかなあ。微妙。",
  user_id: 5,
  drama_id: 13
)

Comment.create!(
  content: "結構重い話。ジュノはカッコ良い！！",
  user_id: 6,
  drama_id: 14
)
Comment.create!(
  content: "なかなかの暗さと重い話。実話をもとにしたものだとは知りませんでした。",
  user_id: 7,
  drama_id: 14
)

Comment.create!(
  content: "チチャンウクが好きで見ました。パク・ミニョンも可愛過ぎました。",
  user_id: 8,
  drama_id: 15
)
Comment.create!(
  content: "ストーリーが良い！先が気になるドラマです！",
  user_id: 9,
  drama_id: 15
)
Comment.create!(
  content: "ハラハラドキドキするドラマです！",
  user_id: 10,
  drama_id: 15
)
Comment.create!(
  content: "イントロのOSTもすごく好きでした。",
  user_id: 11,
  drama_id: 15
)
Comment.create!(
  content: "最初見てた時全くパク・ミニョンちゃんだと気づかなかったです。チチャンウクとの相性最高だと思います。",
  user_id: 12,
  drama_id: 15
)

Comment.create!(
  content: "知っている俳優さんは１人もいなかったけど、面白かったです。",
  user_id: 2,
  drama_id: 16
)
Comment.create!(
  content: "最初から結構面白かったけど後半にかけて話が膨らんでいってどんどん面白くなった！！！",
  user_id: 3,
  drama_id: 16
)
Comment.create!(
  content: "ストーリの展開が早い！最初から最後まで面白かったです。",
  user_id: 4,
  drama_id: 16
)
Comment.create!(
  content: "アクションだけじゃなく人間ドラマとしても楽しめる！続編もあるみたいな・・？",
  user_id: 5,
  drama_id: 16
)

Comment.create!(
  content: "チチャンウクとキムジウォンが出ると言うことで期待していましたが、ストリーは微妙でした。",
  user_id: 6,
  drama_id: 17
)
Comment.create!(
  content: "チチャンウクが好きすぎる。",
  user_id: 7,
  drama_id: 17
)
Comment.create!(
  content: "30分ドラマだから見やすいけど、ストーリー性は微妙。",
  user_id: 8,
  drama_id: 17
)

Comment.create!(
  content: "シン・セギョン初めて知りましたが、可愛いです。好きになりました。",
  user_id: 9,
  drama_id: 18
)
Comment.create!(
  content: "主演の2人が可愛すぎて癒される！ほのぼの系のドラマ。",
  user_id: 10,
  drama_id: 18
)
Comment.create!(
  content: "全体的に盛り上がるところが少ない印象でした。",
  user_id: 11,
  drama_id: 18
)
Comment.create!(
  content: "「何で失敗を過程に入れてあげないの？」が印象的。セリフが良いドラマ！",
  user_id: 12,
  drama_id: 18
)

Comment.create!(
  content: "イ・ジョンソクが好きで見ました！年下男子最高！",
  user_id: 2,
  drama_id: 19
)
Comment.create!(
  content: "王道ラブコメ！年下男子いいね！！",
  user_id: 3,
  drama_id: 19
)
Comment.create!(
  content: "嫌な人が1人もいない、全キャラ好きになる！",
  user_id: 4,
  drama_id: 19
)
Comment.create!(
  content: "芯の強い女性を描いている作品は元気がもらえるし、見終わった後スッキリするので好きです！",
  user_id: 5,
  drama_id: 19
)
Comment.create!(
  content: "キュンが多い。イ・ジュンソク最高！",
  user_id: 6,
  drama_id: 19
)
Comment.create!(
  content: "イ・ジョンソクファンになりそう！重いシーンやドロドロ系ではないので、サクサク見れます！",
  user_id: 7,
  drama_id: 19
)
Comment.create!(
  content: "友達の紹介で見ました。イ・ジョンソクが年下彼氏役ハマり過ぎ。",
  user_id: 8,
  drama_id: 19
)
Comment.create!(
  content: "性格悪い人いなくて心がほっこりしたドラマでした！",
  user_id: 9,
  drama_id: 19
)

Favorite.create!(
  user_id: 2,
  drama_id: 1
)
Favorite.create!(
  user_id: 2,
  drama_id: 3
)
Favorite.create!(
  user_id: 2,
  drama_id: 4
)
Favorite.create!(
  user_id: 2,
  drama_id: 7
)
Favorite.create!(
  user_id: 2,
  drama_id: 8
)
Favorite.create!(
  user_id: 2,
  drama_id: 12
)
Favorite.create!(
  user_id: 2,
  drama_id: 15
)
Favorite.create!(
  user_id: 2,
  drama_id: 16
)
Favorite.create!(
  user_id: 3,
  drama_id: 3
)
Favorite.create!(
  user_id: 3,
  drama_id: 5
)
Favorite.create!(
  user_id: 3,
  drama_id: 6
)
Favorite.create!(
  user_id: 3,
  drama_id: 12
)
Favorite.create!(
  user_id: 4,
  drama_id: 7
)
Favorite.create!(
  user_id: 4,
  drama_id: 8
)
Favorite.create!(
  user_id: 4,
  drama_id: 12
)
Favorite.create!(
  user_id: 4,
  drama_id: 15
)
Favorite.create!(
  user_id: 4,
  drama_id: 16
)
Favorite.create!(
  user_id: 5,
  drama_id: 1
)
Favorite.create!(
  user_id: 5,
  drama_id: 2
)
Favorite.create!(
  user_id: 5,
  drama_id: 3
)
Favorite.create!(
  user_id: 5,
  drama_id: 4
)
Favorite.create!(
  user_id: 5,
  drama_id: 7
)
Favorite.create!(
  user_id: 6,
  drama_id: 8
)
Favorite.create!(
  user_id: 6,
  drama_id: 12
)
Favorite.create!(
  user_id: 6,
  drama_id: 15
)
Favorite.create!(
  user_id: 6,
  drama_id: 16
)
Favorite.create!(
  user_id: 7,
  drama_id: 8
)
Favorite.create!(
  user_id: 7,
  drama_id: 12
)
Favorite.create!(
  user_id: 7,
  drama_id: 15
)
Favorite.create!(
  user_id: 7,
  drama_id: 16
)
Favorite.create!(
  user_id: 8,
  drama_id: 1
)
Favorite.create!(
  user_id: 8,
  drama_id: 2
)
Favorite.create!(
  user_id: 8,
  drama_id: 3
)
Favorite.create!(
  user_id: 8,
  drama_id: 4
)
Favorite.create!(
  user_id: 8,
  drama_id: 7
)
Favorite.create!(
  user_id: 8,
  drama_id: 8
)
Favorite.create!(
  user_id: 9,
  drama_id: 12
)
Favorite.create!(
  user_id: 9,
  drama_id: 15
)
Favorite.create!(
  user_id: 9,
  drama_id: 16
)
Favorite.create!(
  user_id: 10,
  drama_id: 12
)
Favorite.create!(
  user_id: 10,
  drama_id: 15
)
Favorite.create!(
  user_id: 10,
  drama_id: 16
)
Favorite.create!(
  user_id: 11,
  drama_id: 1
)
Favorite.create!(
  user_id: 11,
  drama_id: 2
)
Favorite.create!(
  user_id: 11,
  drama_id: 3
)
Favorite.create!(
  user_id: 11,
  drama_id: 4
)
Favorite.create!(
  user_id: 11,
  drama_id: 7
)
Favorite.create!(
  user_id: 11,
  drama_id: 8
)
Favorite.create!(
  user_id: 11,
  drama_id: 12
)
Favorite.create!(
  user_id: 11,
  drama_id: 15
)
Favorite.create!(
  user_id: 11,
  drama_id: 16
)

Like.create!(
  user_id: 2,
  comment_id: 1
)
Like.create!(
  user_id: 2,
  comment_id: 2
)
Like.create!(
  user_id: 2,
  comment_id: 3
)
Like.create!(
  user_id: 2,
  comment_id: 4
)
Like.create!(
  user_id: 2,
  comment_id: 5
)
Like.create!(
  user_id: 2,
  comment_id: 9
)
Like.create!(
  user_id: 2,
  comment_id: 10
)
Like.create!(
  user_id: 2,
  comment_id: 11
)
Like.create!(
  user_id: 2,
  comment_id: 14
)
Like.create!(
  user_id: 2,
  comment_id: 16
)
Like.create!(
  user_id: 2,
  comment_id: 18
)
Like.create!(
  user_id: 2,
  comment_id: 20
)
Like.create!(
  user_id: 2,
  comment_id: 22
)
Like.create!(
  user_id: 2,
  comment_id: 25
)
Like.create!(
  user_id: 2,
  comment_id: 26
)
Like.create!(
  user_id: 2,
  comment_id: 28
)
Like.create!(
  user_id: 2,
  comment_id: 29
)
Like.create!(
  user_id: 2,
  comment_id: 30
)
Like.create!(
  user_id: 2,
  comment_id: 34
)
Like.create!(
  user_id: 2,
  comment_id: 36
)
Like.create!(
  user_id: 2,
  comment_id: 38
)
Like.create!(
  user_id: 2,
  comment_id: 40
)
Like.create!(
  user_id: 2,
  comment_id: 45
)
Like.create!(
  user_id: 2,
  comment_id: 49
)
Like.create!(
  user_id: 3,
  comment_id: 1
)
Like.create!(
  user_id: 3,
  comment_id: 2
)
Like.create!(
  user_id: 3,
  comment_id: 3
)
Like.create!(
  user_id: 3,
  comment_id: 4
)
Like.create!(
  user_id: 3,
  comment_id: 5
)
Like.create!(
  user_id: 3,
  comment_id: 6
)
Like.create!(
  user_id: 3,
  comment_id: 12
)
Like.create!(
  user_id: 3,
  comment_id: 17
)
Like.create!(
  user_id: 3,
  comment_id: 30
)
Like.create!(
  user_id: 3,
  comment_id: 50
)
Like.create!(
  user_id: 3,
  comment_id: 51
)
Like.create!(
  user_id: 3,
  comment_id: 60
)
Like.create!(
  user_id: 3,
  comment_id: 61
)
Like.create!(
  user_id: 3,
  comment_id: 62
)
Like.create!(
  user_id: 3,
  comment_id: 63
)
Like.create!(
  user_id: 3,
  comment_id: 64
)
Like.create!(
  user_id: 3,
  comment_id: 65
)
Like.create!(
  user_id: 3,
  comment_id: 66
)
Like.create!(
  user_id: 3,
  comment_id: 67
)
Like.create!(
  user_id: 3,
  comment_id: 68
)
Like.create!(
  user_id: 3,
  comment_id: 70
)
Like.create!(
  user_id: 3,
  comment_id: 79
)
Like.create!(
  user_id: 4,
  comment_id: 1
)
Like.create!(
  user_id: 4,
  comment_id: 2
)
Like.create!(
  user_id: 4,
  comment_id: 3
)
Like.create!(
  user_id: 4,
  comment_id: 4
)
Like.create!(
  user_id: 4,
  comment_id: 5
)
Like.create!(
  user_id: 4,
  comment_id: 13
)
Like.create!(
  user_id: 4,
  comment_id: 14
)
Like.create!(
  user_id: 4,
  comment_id: 15
)
Like.create!(
  user_id: 4,
  comment_id: 16
)
Like.create!(
  user_id: 4,
  comment_id: 17
)
Like.create!(
  user_id: 4,
  comment_id: 19
)
Like.create!(
  user_id: 4,
  comment_id: 20
)
Like.create!(
  user_id: 4,
  comment_id: 23
)
Like.create!(
  user_id: 4,
  comment_id: 25
)
Like.create!(
  user_id: 4,
  comment_id: 27
)
Like.create!(
  user_id: 4,
  comment_id: 28
)
Like.create!(
  user_id: 4,
  comment_id: 30
)
Like.create!(
  user_id: 4,
  comment_id: 35
)
Like.create!(
  user_id: 4,
  comment_id: 39
)
Like.create!(
  user_id: 4,
  comment_id: 44
)
Like.create!(
  user_id: 4,
  comment_id: 54
)
Like.create!(
  user_id: 4,
  comment_id: 61
)
Like.create!(
  user_id: 4,
  comment_id: 50
)
Like.create!(
  user_id: 4,
  comment_id: 71
)
Like.create!(
  user_id: 5,
  comment_id: 2
)
Like.create!(
  user_id: 5,
  comment_id: 3
)
Like.create!(
  user_id: 5,
  comment_id: 4
)
Like.create!(
  user_id: 5,
  comment_id: 5
)
Like.create!(
  user_id: 5,
  comment_id: 13
)
Like.create!(
  user_id: 5,
  comment_id: 14
)
Like.create!(
  user_id: 5,
  comment_id: 15
)
Like.create!(
  user_id: 5,
  comment_id: 16
)
Like.create!(
  user_id: 5,
  comment_id: 17
)
Like.create!(
  user_id: 5,
  comment_id: 19
)
Like.create!(
  user_id: 5,
  comment_id: 20
)
Like.create!(
  user_id: 5,
  comment_id: 23
)
Like.create!(
  user_id: 5,
  comment_id: 25
)
Like.create!(
  user_id: 5,
  comment_id: 27
)
Like.create!(
  user_id: 5,
  comment_id: 28
)
Like.create!(
  user_id: 5,
  comment_id: 30
)
Like.create!(
  user_id: 5,
  comment_id: 35
)
Like.create!(
  user_id: 5,
  comment_id: 39
)
Like.create!(
  user_id: 5,
  comment_id: 50
)
Like.create!(
  user_id: 5,
  comment_id: 55
)
Like.create!(
  user_id: 5,
  comment_id: 56
)
Like.create!(
  user_id: 5,
  comment_id: 58
)
Like.create!(
  user_id: 5,
  comment_id: 70
)
Like.create!(
  user_id: 6,
  comment_id: 1
)
Like.create!(
  user_id: 6,
  comment_id: 2
)
Like.create!(
  user_id: 6,
  comment_id: 3
)
Like.create!(
  user_id: 6,
  comment_id: 4
)
Like.create!(
  user_id: 6,
  comment_id: 5
)
Like.create!(
  user_id: 6,
  comment_id: 6
)
Like.create!(
  user_id: 6,
  comment_id: 7
)
Like.create!(
  user_id: 6,
  comment_id: 8
)
Like.create!(
  user_id: 6,
  comment_id: 9
)
Like.create!(
  user_id: 6,
  comment_id: 10
)
Like.create!(
  user_id: 6,
  comment_id: 11
)
Like.create!(
  user_id: 6,
  comment_id: 14
)
Like.create!(
  user_id: 6,
  comment_id: 16
)
Like.create!(
  user_id: 6,
  comment_id: 18
)
Like.create!(
  user_id: 6,
  comment_id: 20
)
Like.create!(
  user_id: 6,
  comment_id: 22
)
Like.create!(
  user_id: 6,
  comment_id: 25
)
Like.create!(
  user_id: 6,
  comment_id: 26
)
Like.create!(
  user_id: 6,
  comment_id: 28
)
Like.create!(
  user_id: 6,
  comment_id: 29
)
Like.create!(
  user_id: 6,
  comment_id: 30
)
Like.create!(
  user_id: 6,
  comment_id: 34
)
Like.create!(
  user_id: 6,
  comment_id: 36
)
Like.create!(
  user_id: 6,
  comment_id: 38
)
Like.create!(
  user_id: 6,
  comment_id: 40
)
Like.create!(
  user_id: 6,
  comment_id: 45
)
Like.create!(
  user_id: 6,
  comment_id: 49
)
Like.create!(
  user_id: 7,
  comment_id: 1
)
Like.create!(
  user_id: 7,
  comment_id: 2
)
Like.create!(
  user_id: 7,
  comment_id: 3
)
Like.create!(
  user_id: 7,
  comment_id: 4
)
Like.create!(
  user_id: 7,
  comment_id: 5
)
Like.create!(
  user_id: 7,
  comment_id: 6
)
Like.create!(
  user_id: 7,
  comment_id: 7
)
Like.create!(
  user_id: 7,
  comment_id: 8
)
Like.create!(
  user_id: 7,
  comment_id: 9
)
Like.create!(
  user_id: 7,
  comment_id: 10
)
Like.create!(
  user_id: 7,
  comment_id: 11
)
Like.create!(
  user_id: 7,
  comment_id: 14
)
Like.create!(
  user_id: 7,
  comment_id: 16
)
Like.create!(
  user_id: 7,
  comment_id: 18
)
Like.create!(
  user_id: 7,
  comment_id: 20
)
Like.create!(
  user_id: 7,
  comment_id: 22
)
Like.create!(
  user_id: 7,
  comment_id: 25
)
Like.create!(
  user_id: 7,
  comment_id: 26
)
Like.create!(
  user_id: 7,
  comment_id: 28
)
Like.create!(
  user_id: 7,
  comment_id: 29
)
Like.create!(
  user_id: 7,
  comment_id: 30
)
Like.create!(
  user_id: 7,
  comment_id: 34
)
Like.create!(
  user_id: 7,
  comment_id: 36
)
Like.create!(
  user_id: 7,
  comment_id: 38
)
Like.create!(
  user_id: 7,
  comment_id: 40
)
Like.create!(
  user_id: 7,
  comment_id: 45
)
Like.create!(
  user_id: 7,
  comment_id: 49
)
Like.create!(
  user_id: 7,
  comment_id: 55
)
Like.create!(
  user_id: 8,
  comment_id: 2
)
Like.create!(
  user_id: 8,
  comment_id: 3
)
Like.create!(
  user_id: 8,
  comment_id: 4
)
Like.create!(
  user_id: 8,
  comment_id: 5
)
Like.create!(
  user_id: 8,
  comment_id: 6
)
Like.create!(
  user_id: 8,
  comment_id: 7
)
Like.create!(
  user_id: 9,
  comment_id: 27
)
Like.create!(
  user_id: 9,
  comment_id: 30
)
Like.create!(
  user_id: 9,
  comment_id: 33
)
Like.create!(
  user_id: 9,
  comment_id: 50
)
Like.create!(
  user_id: 9,
  comment_id: 60
)
Like.create!(
  user_id: 9,
  comment_id: 70
)
Like.create!(
  user_id: 10,
  comment_id: 1
)
Like.create!(
  user_id: 10,
  comment_id: 2
)
Like.create!(
  user_id: 10,
  comment_id: 3
)
Like.create!(
  user_id: 10,
  comment_id: 4
)
Like.create!(
  user_id: 10,
  comment_id: 5
)
Like.create!(
  user_id: 10,
  comment_id: 13
)
Like.create!(
  user_id: 10,
  comment_id: 14
)
Like.create!(
  user_id: 10,
  comment_id: 15
)
Like.create!(
  user_id: 10,
  comment_id: 16
)
Like.create!(
  user_id: 10,
  comment_id: 17
)
Like.create!(
  user_id: 10,
  comment_id: 19
)
Like.create!(
  user_id: 10,
  comment_id: 20
)
Like.create!(
  user_id: 10,
  comment_id: 23
)
Like.create!(
  user_id: 10,
  comment_id: 25
)
Like.create!(
  user_id: 10,
  comment_id: 27
)
Like.create!(
  user_id: 10,
  comment_id: 28
)
Like.create!(
  user_id: 10,
  comment_id: 29
)
Like.create!(
  user_id: 10,
  comment_id: 35
)
Like.create!(
  user_id: 10,
  comment_id: 39
)
Like.create!(
  user_id: 10,
  comment_id: 42
)
Like.create!(
  user_id: 10,
  comment_id: 55
)
Like.create!(
  user_id: 10,
  comment_id: 56
)
Like.create!(
  user_id: 10,
  comment_id: 59
)
Like.create!(
  user_id: 10,
  comment_id: 71
)
Like.create!(
  user_id: 11,
  comment_id: 1
)
Like.create!(
  user_id: 11,
  comment_id: 2
)
Like.create!(
  user_id: 11,
  comment_id: 5
)
Like.create!(
  user_id: 11,
  comment_id: 30
)
Like.create!(
  user_id: 11,
  comment_id: 40
)
Like.create!(
  user_id: 11,
  comment_id: 50
)
Like.create!(
  user_id: 11,
  comment_id: 60
)
Like.create!(
  user_id: 11,
  comment_id: 70
)


Like.create!(
  user_id: 12,
  comment_id: 1
)
Like.create!(
  user_id: 12,
  comment_id: 2
)
Like.create!(
  user_id: 12,
  comment_id: 3
)
Like.create!(
  user_id: 12,
  comment_id: 4
)
Like.create!(
  user_id: 12,
  comment_id: 5
)
Like.create!(
  user_id: 12,
  comment_id: 6
)
Like.create!(
  user_id: 12,
  comment_id: 7
)
Like.create!(
  user_id: 12,
  comment_id: 8
)
Like.create!(
  user_id: 12,
  comment_id: 9
)
Like.create!(
  user_id: 12,
  comment_id: 10
)
Like.create!(
  user_id: 12,
  comment_id: 11
)
Like.create!(
  user_id: 12,
  comment_id: 14
)
Like.create!(
  user_id: 12,
  comment_id: 15
)
Like.create!(
  user_id: 12,
  comment_id: 19
)
Like.create!(
  user_id: 12,
  comment_id: 20
)
Like.create!(
  user_id: 12,
  comment_id: 22
)
Like.create!(
  user_id: 12,
  comment_id: 24
)
Like.create!(
  user_id: 12,
  comment_id: 26
)
Like.create!(
  user_id: 12,
  comment_id: 28
)
Like.create!(
  user_id: 12,
  comment_id: 29
)
Like.create!(
  user_id: 12,
  comment_id: 30
)
Like.create!(
  user_id: 12,
  comment_id: 34
)
Like.create!(
  user_id: 12,
  comment_id: 37
)
Like.create!(
  user_id: 12,
  comment_id: 38
)
Like.create!(
  user_id: 12,
  comment_id: 40
)
Like.create!(
  user_id: 12,
  comment_id: 41
)
Like.create!(
  user_id: 12,
  comment_id: 42
)
Like.create!(
  user_id: 12,
  comment_id: 45
)
Like.create!(
  user_id: 12,
  comment_id: 49
)
Like.create!(
  user_id: 12,
  comment_id: 55
)
Like.create!(
  user_id: 12,
  comment_id: 56
)
Like.create!(
  user_id: 12,
  comment_id: 57
)

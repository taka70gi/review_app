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

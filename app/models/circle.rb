class Circle < ApplicationRecord
  belongs_to :user
  has_many  :host_circles
  has_many :circle_joins, class_name: "Join", dependent: :destroy
  attachment :circle_img

  # 入力設定
  validates :genre, presence: true
  validates :circle_name, length: 1..20
  validates :active_area, presence: true
  validates :circle_img, presence: true
  validates :age_group, presence: true
  validates :explanation, presence: true


  #キーワード検索
  def self.search(search)
    if search
      where(['circle_name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  #ジャンル検索
  scope :get_by_genre, ->(genre) {
    where(genre: genre)
  }

  #地域検索
  scope :get_by_active_area, ->(active_area) {
    where(active_area: active_area)
  }

   #募集年齢層検索
  scope :get_by_age_group, ->(age_group) {
    where(age_group: age_group)
  }

  #サークル参加してるか？
  def joined_by?(user)
    circle_joins.where(user_id: user.id).exists?
  end

  enum active_area: {北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47}

  enum genre: {スポーツ:1,遊ぶ:2,食べる:3,学ぶ:4,つくる:5,ゲーム:6,音楽:7,その他:8}

  enum age_group: {'指定しない':'指定しない','20代':'20代','30代':'30代','40代':'40代','50代以上':'50代以上'}
end

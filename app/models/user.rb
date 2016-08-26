class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validate :avatar_size
  validates :name, presence: true, length: {maximum: 30},
    uniqueness: {case_sensitive: false}
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :review_businesses, dependent: :destroy
  has_many :businesses, through: :review_businesses, dependent: :destroy
  has_many :place_suggestions, dependent: :destroy
  has_many :review_places, dependent: :destroy
  has_many :places, through: :review_places, dependent: :destroy
  has_many :journey_diaries, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_follows, class_name: Follow.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_follows, class_name: Follow.name,
    foreign_key: :following_id, dependent: :destroy
  has_many :following, through: :active_follows, source: :following
  has_many :followers, through: :passive_follows, source: :follower

  enum user_role: [ :user, :mod, :admin ]

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.avatar = auth.info.image
        user.password = Devise.friendly_token[0,20]
      end
    end

    def new_with_session params, session
      super.tap do |user|
        if data = session["devise.facebook_data"] &&
          session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end

  private
  def avatar_size
    if avatar.size > Settings.size_avatar.megabytes
      self.errors.add :avatar, I18n.t("users.avatar.error_size")
    end
  end
end

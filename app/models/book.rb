class Book < ApplicationRecord

  has_one_attached :profile_image
  belongs_to :user

  #titleが存在しているかを確認するバリデーション
  validates :title, presence: true
  #bodyが存在しているかを確認するバリデーション
  validates :body, presence: true, length: { maximum: 200 }

  def get_profile_image
    if profile_image.attached?
      profile_image
    else
      'no_image.jpg'
    end
  end


end

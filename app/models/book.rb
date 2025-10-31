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

  def self.search_for(content, method)
    content = '' if content.nil?  # contentがnilの場合は空文字列に変更
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%'+content)
    else
      Book.where('title LIKE ?', '%'+content+'%')
    end
  end

end

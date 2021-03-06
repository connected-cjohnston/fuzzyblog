class Article < ApplicationRecord
  has_one_attached :article_image, dependent: :destroy
  belongs_to :user

  validates :article_image, content_type: [:png, :jpg, :jpeg]
end

class Article < ApplicationRecord
  has_one_attached :article_image, dependent: :destroy
  validates :article_image, content_type: [:png, :jpg, :jpeg]
end

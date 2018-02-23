class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_attached_file :image, styles: { post_index: "750x300", large: "600x600", medium: "300x300>", thumb: "100x100#{}>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  

end

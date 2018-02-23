class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_attached_file :image, styles: { post_index: "750x300", large: "600x600", medium: "300x300>", thumb: "100x100#{}>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  after_save    :expire_contact_all_cache
  after_destroy :expire_contact_all_cache
  def self.all_cached
    Rails.cache.fetch('Post.all') { all.to_a }
  end
end

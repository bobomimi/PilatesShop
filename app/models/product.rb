class Product < ApplicationRecord
	translates :title,:slug ,:sub_title ,:price ,:body
	extend FriendlyId
    friendly_id :title, use: :globalize
	has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "100x100#{}>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    validates :title,  presence: true, uniqueness: true
    validates :price, presence: true, numericality: { greater_than: 0 }
 
  def price_in_cents
    (price * 100).to_i
  end


end

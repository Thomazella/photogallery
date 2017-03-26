class Photo < ApplicationRecord
  belongs_to :contributor
  has_many :taggers
  has_many :tags, through: :taggers

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 255 }

  validates :image, presence: true
  has_attached_file :image,
                    :styles => { :thumb => "200x200#",
                                 :big_square => "400x400#"}
  validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
  validates_attachment_size :image, :in => 0.megabytes..2.megabytes

  validates :tag_list_temp, length: {maximum: 500}
end

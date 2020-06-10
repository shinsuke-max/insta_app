# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  #has_many :photos, dependent: :destroy
  has_one_attached :image
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size:         { less_than: 5.megabytes,
                                      message: "should be less than 5MB" }

  #accepts_nested_attributes_for :photos

  #def liked_by(user)
  #  Like.find_by(user_id: user.id, post_id: id)
  #end

  def self.ransackable_attributes(auth_object = nil)
    %w[caption]
  end

  def self.ransackable_associations(auth_object =nil)
    []
  end

  #def display_image
  #  image.variant(resize_to_limit: [500, 500])
  #end
end

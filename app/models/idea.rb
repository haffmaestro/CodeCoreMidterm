class Idea < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
  validates :description, uniqueness: true, presence: true
  mount_uploader :attachment, AttachmentUploader


  belongs_to :user
  has_many :comments

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :joins, dependent: :destroy
  has_many :joined_users, through: :joins, source: :user

  def user_permission(current_user)
    user == current_user
  end

  def joins_for(user)
    joins.find_by_user_id user
  end

  def likes_for(user)
    likes.find_by_user_id user
  end

  def self.search(search_term)
    where("title ILIKE :search_term OR description ILIKE :search_term", {search_term: '%'+search_term+'%'})
  end
end

class Post < ApplicationRecord

  has_many_attached :images,dependent: :destroy
  belongs_to :user
  has_many :comments
  has_many :likes,dependent: :destroy

  validates :text,        presence: { message: 'を入力してください' }
  validates :images,       presence: { message: 'を1枚以上添付してください' }  


  def self.search(keyword)
    if keyword != ""
      Post.where("text LIKE?", "%#{keyword}%") .includes(:user).order('created_at DESC')
    else
      Post.all.includes(:user).order('created_at DESC')
    end 
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def add_favorite(post)
    # Need to create a favorite
    Favorite.create(
        user_id: id, # self.id
        post_id: post.id
    )
  end

  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post
end

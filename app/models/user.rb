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
  has_many :posts, through: :favorites

  def favorite_posts
    # favorites = Favorite.where user_id: id
    # post_ids = favorites.map { |f| f.post_id }

    # post_ids = Favorite.where(user_id: id).pluck :post_id
    # Post.where(id: post_ids)
    posts
  end
end

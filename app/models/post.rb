class Post < ApplicationRecord
  # contentカラムに対して、空の投稿を制御する
  validates :content,{presence: true,length: {maximum: 140}}

  # user_idカラムに対して、空の投稿を制御する
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end
end

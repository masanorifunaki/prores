class User < ApplicationRecord
  has_secure_password
  # nameカラムに関するバリデーション
  validates:name,{presence: true}
  # twitterカラムに関するバリデーション
  validates:twitter,{presence: true,uniqueness: true}
  
  def posts
    return Post.where(user_id: self.id)
  end

end

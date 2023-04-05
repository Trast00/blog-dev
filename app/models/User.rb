 class User < ApplicationRecord
  has_many: comment
  has_many: post
  has_many: like
  
  def getTopThree
    User.limite(3)
  end
 end
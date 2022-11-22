class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorite_movies
  has_many :comments, dependent: :destroy

  enum is_deleted: {Available: false, Invalid: true}
    #有効会員はtrue、退会済み会員はfalse

    def deleted_for_authentication?
        super && (self.is_deleted == "Available")
    end
    #is_activeが有効の場合は有効会員(ログイン可能)

end

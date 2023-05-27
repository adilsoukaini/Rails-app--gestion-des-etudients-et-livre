class Utilisateur < ApplicationRecord
  validates :nom,presence: true, length:{maximum:50} 
         has_many :articles, dependent: :destroy        #lorsque je supprime un user ,ses articles seront supprimes
  #nom doit etre present ou il va afficher une erreur front

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence: true, length: { maximum:255 }, format:{ with: VALID_EMAIL }

  validates :password,presence: true,length: {minimum: 6 }

  has_secure_password
end

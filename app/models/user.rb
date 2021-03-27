class User < ApplicationRecord
  # has_secure_password ajoute deux attributs (non persistés en base) :
  # - password
  # - password_confirmation
  has_secure_password

  # pour créer un nouvel User: 
  #   User.create({email: "nom@domain", password: "passwd", password_confirmation: "passwd"})
  validates(:email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "doit être une adresse email valide." })
  validates(:password, presence: true)
  validates(:password_confirmation, presence: true)
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
  
  INSTITUCIONES = ["DINAPYME", "STPC", "INEFOP", "ANDE"]

  validates :institucion, inclusion: {
    in: INSTITUCIONES,
    message: "Tiene que ser una institucion válida"
  }
end

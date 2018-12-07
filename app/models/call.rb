class Call < ApplicationRecord
    
  validates :nombre, presence: true
  has_many :proposals
  
  CENTROS = ["Rivera", "Tacuarembó"]

  validates :centro, inclusion: {
   in: CENTROS,
    message: "Tiene que ser un centro válid"
  }
end

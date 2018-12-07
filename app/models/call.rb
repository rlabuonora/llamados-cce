class Call < ApplicationRecord
    
  validates :nombre, presence: true
  
  CENTROS = ["Rivera", "Tacuarembó"]

  validates :centro, inclusion: {
   in: CENTROS,
    message: "Tiene que ser una institucion válida"
  }
end

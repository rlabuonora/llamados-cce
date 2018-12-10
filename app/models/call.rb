class Call < ApplicationRecord
    
  
  has_many :proposals, dependent: :destroy
  
  CENTROS = ["Rivera", "Tacuarembó"]
  PUBLICOS = ["Empresas", "Emprendedores"]
  MODALIDADES = ["Capacitación", "Asistencia Técnica"]


  validates :nombre, presence: true
  #validates :modalidad, presence: true
  #validates :publico, presence: true
  validates :centro, inclusion: {
   in: CENTROS,
    message: "Tiene que ser un centro válido"
  }
  
  # validates :publico, inclusion: {
  #  in: PUBLICOS,
  #   message: "Tiene que ser un publico válido"
  # }
  
  # validates :modalidad, inclusion: {
  #  in: MODALIDADES,
  #   message: "Tiene que ser una modalidad válida"
  # }
end

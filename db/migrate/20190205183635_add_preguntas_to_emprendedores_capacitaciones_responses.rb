class AddPreguntasToEmprendedoresCapacitacionesResponses < ActiveRecord::Migration[5.2]
  def change
    add_column :emprendedores_capacitaciones_responses, :formacion, :decimal
    add_column :emprendedores_capacitaciones_responses, :costo, :decimal
    add_column :emprendedores_capacitaciones_responses, :horas, :decimal
  end
end

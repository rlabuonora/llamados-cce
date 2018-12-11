class CreateEmprendedoresCapacitacionesResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :emprendedores_capacitaciones_responses do |t|
      t.numeric :propuesta
      t.numeric :antecedentes
      t.numeric :conocimiento

      t.timestamps
    end
  end
end

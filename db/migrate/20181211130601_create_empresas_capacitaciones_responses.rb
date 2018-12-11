class CreateEmpresasCapacitacionesResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :empresas_capacitaciones_responses do |t|
      t.numeric :exp_pob
      t.numeric :problematica
      t.numeric :formacion

      t.timestamps
    end
  end
end

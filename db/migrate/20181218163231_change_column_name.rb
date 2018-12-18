class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    change_table :empresas_capacitaciones_responses do |t|
      t.rename :exp_pob, :formacion_titulo
      t.rename :problematica, :estudios
      t.rename :formacion, :formacion_equipo
    end
    
  end
end



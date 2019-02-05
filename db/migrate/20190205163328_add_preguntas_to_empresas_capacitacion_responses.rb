class AddPreguntasToEmpresasCapacitacionResponses < ActiveRecord::Migration[5.2]
  def change
    add_column :empresas_capacitaciones_responses, :antecedentes_formacion, :decimal
    add_column :empresas_capacitaciones_responses, :antecedentes_territorio, :decimal
    add_column :empresas_capacitaciones_responses, :experiencia_tecno, :decimal
    add_column :empresas_capacitaciones_responses, :desarrollo, :decimal
    add_column :empresas_capacitaciones_responses, :pertinencia, :decimal
    add_column :empresas_capacitaciones_responses, :objetivo, :decimal
    add_column :empresas_capacitaciones_responses, :metodologia, :decimal
    add_column :empresas_capacitaciones_responses, :perfil, :decimal
    add_column :empresas_capacitaciones_responses, :innovacion, :decimal
    add_column :empresas_capacitaciones_responses, :materiales, :decimal
    add_column :empresas_capacitaciones_responses, :actividades, :decimal
  end
end

class AddModalidadToCall < ActiveRecord::Migration[5.2]
  def change
    add_column :calls, :modalidad, :string
  end
end

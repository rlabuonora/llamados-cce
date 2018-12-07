class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.string :proveedor
      t.references :call, foreign_key: true

      t.timestamps
    end
  end
end

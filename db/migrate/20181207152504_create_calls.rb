class CreateCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :calls do |t|
      t.string :nombre
      t.string :centro

      t.timestamps
    end
  end
end

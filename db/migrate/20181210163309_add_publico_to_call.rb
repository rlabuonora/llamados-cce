class AddPublicoToCall < ActiveRecord::Migration[5.2]
  def change
    add_column :calls, :publico, :string
  end
end

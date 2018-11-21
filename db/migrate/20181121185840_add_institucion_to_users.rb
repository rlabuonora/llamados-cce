class AddInstitucionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :institucion, :string
  end
end

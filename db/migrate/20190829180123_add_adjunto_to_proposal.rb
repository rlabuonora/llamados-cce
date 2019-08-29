class AddAdjuntoToProposal < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :adjunto, :string
  end
end

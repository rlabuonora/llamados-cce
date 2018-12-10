class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :proposal, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

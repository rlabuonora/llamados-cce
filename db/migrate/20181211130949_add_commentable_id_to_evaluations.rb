class AddCommentableIdToEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :evaluatable_id, :integer
    add_column :evaluations, :evaluatable_type, :string
  end
end

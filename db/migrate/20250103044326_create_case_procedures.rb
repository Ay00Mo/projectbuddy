class CreateCaseProcedures < ActiveRecord::Migration[7.0]
  def change
    create_table :case_procedures do |t|
      t.references :case, null: false, foreign_key: true
      t.references :procedure, null: false, foreign_key: true
      t.timestamps
    end
  end
end

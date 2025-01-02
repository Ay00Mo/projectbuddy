class CreateProcedures < ActiveRecord::Migration[7.0]
  def change
    create_table :procedures do |t|
      t.string :procedure_name, null: false
      t.timestamps
    end
  end
end

class AddUniqueIndexToProceduresProcedureName < ActiveRecord::Migration[7.0]
  def change
    add_index :procedures, :procedure_name, unique: true
  end
end

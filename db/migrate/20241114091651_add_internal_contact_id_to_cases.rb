class AddInternalContactIdToCases < ActiveRecord::Migration[7.0]
  def change
    add_reference :cases, :internal_contact, foreign_key: { to_table: :users }, null: false
  end
end

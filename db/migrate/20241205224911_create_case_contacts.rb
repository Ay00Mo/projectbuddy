class CreateCaseContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :case_contacts do |t|
      t.references :case, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.timestamps
    end
  end
end

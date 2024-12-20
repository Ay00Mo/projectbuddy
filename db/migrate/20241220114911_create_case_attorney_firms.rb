class CreateCaseAttorneyFirms < ActiveRecord::Migration[7.0]
  def change
    create_table :case_attorney_firms do |t|
      t.references :case, null: false, foreign_key: true
      t.references :attorney_firm, null: false, foreign_key: true
      t.timestamps
    end
  end
end

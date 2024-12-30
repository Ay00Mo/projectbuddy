class CreateAttorneyFirms < ActiveRecord::Migration[7.0]
  def change
    create_table :attorney_firms do |t|
      t.string :firm_name_jp, null: false
      t.string :firm_name_en, null: false
      t.timestamps
    end
  end
end

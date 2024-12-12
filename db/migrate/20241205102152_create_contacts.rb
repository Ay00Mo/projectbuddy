class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :last_name_jp, null: false
      t.string :first_name_jp, null: false
      t.string :last_name_en, null: false
      t.string :first_name_en, null: false
      t.timestamps
    end
  end
end

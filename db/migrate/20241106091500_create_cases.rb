class CreateCases < ActiveRecord::Migration[7.0]
  def change
    create_table :cases do |t|
      t.string :reference_number, null: false
      t.string :application_number, null: false
      t.string :country_code, null: false
      t.integer :law_category_id, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.date :beginning_date, null: false
      t.date :deadline, null: false
      t.date :absolute_deadline, null: false
      t.date :request_date
      t.date :delivery_date
      t.date :response_date
      t.date :instruction_date
      t.date :filing_date
      t.text :remarks

      t.timestamps
    end
  end
end

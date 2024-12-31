class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.string :applicant_name_jp, null: false
      t.string :applicant_name_en, null: false
      t.timestamps
    end
  end
end

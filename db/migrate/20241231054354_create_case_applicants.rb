class CreateCaseApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :case_applicants do |t|
      t.references :case, null: false, foreign_key: true
      t.references :applicant, null: false, foreign_key: true
      t.timestamps
    end
  end
end

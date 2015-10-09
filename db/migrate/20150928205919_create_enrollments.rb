class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.belongs_to :student, index: true
      t.belongs_to :course, index: true
      t.string :grade

      t.timestamps null: false
    end
  end
end

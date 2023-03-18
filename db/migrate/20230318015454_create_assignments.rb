class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.string :course #Faker::Educator.course_name
      t.string :assignment_type #HW, quiz, test, lab, project
      t.datetime :due_date #Faker::Date.forward(days: 15)
      t.boolean :submitted
      t.boolean :on_time
      t.integer :score #Faker::Number.between(from: 40, to: 100)
      t.string :notes #Faker::Adjective.positive OR Faker::Movie.quote
      t.integer :student_id #creates connection to Students table
    end
  end
end

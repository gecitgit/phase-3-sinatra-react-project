class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name #Faker::Name::first_name
      t.string :last_name #Faker::Name::last_name
      t.string :student_pic #Avatar.image(format: "jpg", set: "set1", bgset: "bg1")
      t.string :gender #Faker::Gender.type
      t.integer :age #do current year minus birth year?
      t.datetime :birthday #Faker::Date.birthday(min_age: 10, max_age: 18) -- the class here is Date.
      t.string :academic_standing #
      t.string :hobby #Faker::Hobby.activity
      t.string :allergies #Faker::Food.spice
      t.string :e_contact_name #Faker::Name.name
      t.string :e_contact_relationship #Faker::Relationship.familial
      t.string :e_contact_number #Faker::PhoneNumber.cell_phone
    end
  end
end

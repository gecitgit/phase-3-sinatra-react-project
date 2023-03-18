puts "🌱 Seeding spices..."
# Seed your database here
academic_standings = ["Good Standing", "Warning", "Probation"]
pronoun_array = ["He/Him", "She/Her", "They/Them", "He/Them", "She/Them", "Other"]
assignment_types = ["Test", "Quiz", "Lab", "Project", "Homework"]

6.times do
    student_bday = Faker::Date.birthday(min_age: 8, max_age: 23)
    student_age = Time.now.year - student_bday.year
    student = Student.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        student_pic: Faker::Avatar.image(format: "jpg", set: "set1", bgset: "bg1"),
        pronouns: pronoun_array.sample,
        age: student_age,
        birthday: student_bday,
        academic_standing: academic_standings.sample,
        hobby: Faker::Hobby.activity,
        allergies: Faker::Food.spice,
        e_contact_name: Faker::Name.name,
        e_contact_relationship: Faker::Relationship.familial,
        e_contact_number: Faker::PhoneNumber.cell_phone
    )

    rand(3..5).times do
        submitted = Faker::Boolean.boolean
        student.assignments.create(
            course: Faker::Educator.course_name,
            assignment_type: assignment_types.sample,
            due_date: Faker::Date.forward(days: 15),
            submitted: submitted,
            on_time: submitted ? Faker::Boolean.boolean : false,
            score: Faker::Number.between(from: 40, to: 100),
            notes: Faker::Movie.quote,
            student_id: student.id
        )
    end
end

puts "✅ Done seeding!"

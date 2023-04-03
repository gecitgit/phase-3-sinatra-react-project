class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  #handles the initial request for all student info + nested assignment info
  get "/students" do
    students = Student.all
    students.to_json(include: :assignments)
  end

  #add an assignment for a student
  post "/students/:student_id/assignments" do
    student = Student.find(params[:student_id])
    newAssignment = student.assignments.create(
      course: params[:course],
      assignment_type: params[:assignment_type],
      due_date: params[:due_date],
      submitted: params[:submitted],
      on_time: params[:on_time],
      score: params[:score],
      notes: params[:notes]
    )
    newAssignment.to_json
  end

  #delete a student's assignment
  delete "/students/:student_id/assignments/:id" do
    student = Student.find(params[:student_id])
    assignment = student.assignments.find(params[:id])
    assignment.destroy
    assignment.to_json
  end

  #delete a student by id
  delete "/students/:id" do
    student = Student.find(params[:id])
    student.destroy
    student.to_json
  end

  #add new student
  post "/students" do
    student = Student.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      student_pic: params[:student_pic],
      pronouns: params[:pronouns],
      age: params[:age],
      birthday: params[:birthday],
      academic_standing: params[:academic_standing],
      hobby: params[:hobby],
      allergies: params[:allergies],
      e_contact_name: params[:e_contact_name],
      e_contact_relationship: params[:e_contact_relationship],
      e_contact_number: params[:e_contact_number]
    )
    student.to_json(include: :assignments)
  end

  #update student info
  patch "/students/:id" do
    student = Student.find(params[:id])
    student.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      student_pic: params[:student_pic],
      pronouns: params[:pronouns],
      age: params[:age],
      birthday: params[:birthday],
      academic_standing: params[:academic_standing],
      hobby: params[:hobby],
      allergies: params[:allergies],
      e_contact_name: params[:e_contact_name],
      e_contact_relationship: params[:e_contact_relationship],
      e_contact_number: params[:e_contact_number]
    )
    student.to_json(include: :assignments)
  end

  #update specific student assignment
  patch "/students/:student_id/assignments/:id" do
    student = Student.find(params[:student_id])
    assignment = Assignment.find(params[:id])
    assignment.update(
      course: params[:course],
      assignment_type: params[:assignment_type],
      due_date: params[:due_date],
      submitted: params[:submitted],
      on_time: params[:on_time],
      score: params[:score],
      notes: params[:notes]
    )
    assignment.to_json
  end


  # These existed simply to allow for easier navigation through browser JSON viewer and Postman
  # get "/students/:id" do
  #   student = Student.find(params[:id])
  #   student.to_json(include: :assignments)
  # end
  
  # get "/students/:id/assignments" do
  #   student = Student.find(params[:id])
  #   assignments = student.assignments.all
  #   assignments.to_json
  # end

  # get "/assignments" do
  #   assignments = Assignment.all
  #   assignments.to_json
  # end

  # get "/assignments/:id" do
  #   assignment = Assignment.find(params[:id])
  #   assignment.to_json
  # end

  # delete "/assignments/:id" do
  #   message = Message.find(params[:id])
  #   message.destroy
  #   message.to_json
  # end

end

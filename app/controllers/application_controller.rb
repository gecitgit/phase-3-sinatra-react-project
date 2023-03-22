class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  #handles the initial request for all student info + nested assignment info
  get "/students" do
    students = Student.all
    students.to_json(include: :assignments)
  end

  post "/students/:id/assignments" do
    student = Student.find(params[:id])
    newAssignment = Assignment.create(
      course: params[:course],
      assignment_type: params[:assignment_type],
      due_date: params[:due_date],
      submitted: params[:submitted],
      on_time: params[:on_time],
      score: params[:score],
      notes: params[:notes],
      student_id: student.id
    )
    newAssignment.to_json
  end

  delete "/students/:id/assignments/:student_id" do
    student = Student.find(params[:id])
    assignment = Assignment.find(params[:student_id])
    assignment.destroy
    assignment.to_json
  end


  delete "/students/:id" do
    student = Student.find(params[:id])
    student.destroy
    student.to_json
  end

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

  patch "/students/:id/assignments/:student_id" do
    student = Student.find(params[:id])
    assignment = Assignment.find(params[:student_id])
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

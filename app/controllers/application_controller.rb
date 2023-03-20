class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { 
      stuff: [
        {
          message: "Good luck with your project!"
        },
        {
          message: "And have fun!"
        }
      ]
    }.to_json
  end

  #handles the initial request for all student info + nested assignment info
  get "/students" do
    students = Student.all
    students.to_json(include: :assignments)
  end

  get "/students/:id" do
    student = Student.find(params[:id])
    student.to_json(include: :assignments)
  end

  get "/assignments" do
    assignments = Assignment.all
    assignments.to_json
  end

  get "/assignments/:id" do
    assignment = Assignment.find(params[:id])
    assignment.to_json
  end

  delete "/assignments/:id" do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
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



  #there will be a post to handle new students OR assignments getting added

  #post "/students" do
    #student = Student.create(all kinds of params in here)
    #student.to_json
  #end


  #this will handle PATCH requests to the individual assignments
  #patch "/students/:id/assignments/:id" do ???
    #do stuff
  #end

end

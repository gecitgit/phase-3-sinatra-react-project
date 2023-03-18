class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    # { message: "Good luck with your project!" }.to_json
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

end

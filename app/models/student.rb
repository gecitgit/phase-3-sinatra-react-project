class Student < ActiveRecord::Base
    has_many :assignments
end
class Student < ActiveRecord::Base
    has_many :assignments, dependent: :destroy
end
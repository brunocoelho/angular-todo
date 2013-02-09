class Todo < ActiveRecord::Base
  attr_accessible :description, :done
  belongs_to :user
end

class Post < ApplicationRecord
  self.abstract_class =true
  validates_presence_of :user_id
end

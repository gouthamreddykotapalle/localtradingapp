class Post < ApplicationRecord
  self.abstract_class =true
  validates_presence_of :user_id

  def self.all_categories
    self.pluck(:category).uniq
  end

  def self.with_categories(categories)
    self.where :category => categories
  end

end

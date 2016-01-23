class Person < ActiveRecord::Base

  def self.ordered_list
    Person.all.order(rejection_count: :desc)
  end
end

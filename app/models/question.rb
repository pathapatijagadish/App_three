class Question < ActiveRecord::Base
  attr_accessible :content, :subject, :flyer_id
  belongs_to :flyer
end

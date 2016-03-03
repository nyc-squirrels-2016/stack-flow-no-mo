class Tag < ActiveRecord::Base
  has_many :tag_questions
  has_many :questions, through: :tag_questions
end

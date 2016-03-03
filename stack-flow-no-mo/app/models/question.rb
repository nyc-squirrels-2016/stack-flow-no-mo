class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :votes, as: :voteable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :tag_questions
  has_many :tags, through: :tag_questions
end

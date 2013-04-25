class Question < ActiveRecord::Base
  attr_accessible :content, :question_type, :survey_id,  :answers_attributes
  belongs_to :survey
  has_many :answers, :dependent => :destroy
  has_many :responses, :dependent => :destroy
  accepts_nested_attributes_for :answers, 
  								:reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  validates :content, presence: true
  #Constants corresponding to question type.
  MULTIPLE_CHOICE = 1
  CHECKLIST = 2
  SHORT_ANSWER = 3
  LONG_ANSWER = 4
  EMAIL = 5


  def is_multiple_choice?
  	self.question_type == MULTIPLE_CHOICE
  end

  def is_checklist?
  	self.question_type == CHECKLIST
  end

  def is_short_answer?
  	self.question_type == SHORT_ANSWER
  end

  def is_long_answer?
  	self.question_type == LONG_ANSWER
  end

  def is_email?
    self.question_type == EMAIL
  end
end

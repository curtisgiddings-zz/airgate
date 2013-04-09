class Question < ActiveRecord::Base
  attr_accessible :content, :question_type, :survey_id,  :answers_attributes
  belongs_to :survey
  has_many :answers, :dependent => :destroy
  validates :content, presence: true
  accepts_nested_attributes_for :answers, 
  								:reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  #Constants corresponding to question type.
  MULTIPLE_CHOICE = 1
  CHECKLIST = 2
  SHORT_ANSWER = 3
  LONG_ANSWER = 4

  def is_multiple_choice?
  	self.type == 1
  end

  def is_checklist?
  	self.type == 2
  end

  def is_short_answer?
  	self.type == 3
  end

  def is_long_answer?
  	self.type == 4
  end
end

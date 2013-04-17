class Survey < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :responses
  attr_accessible :name, :questions_attributes, :responses_attributes
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :responses, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  validates :name, presence: true
end

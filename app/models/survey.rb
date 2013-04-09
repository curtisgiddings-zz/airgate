class Survey < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  validates :name, presence: true
  attr_accessible :name, :questions_attributes
end

class Survey < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :responses
  attr_accessible :name, :router_type, :questions_attributes, :responses_attributes
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :responses, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  validates :name, presence: true

  #Constants corresponding to router type.
  DDWRT = 1
  NOCATSPLASH = 2
  WIFIDOG = 3
  BLUESOCKET = 4

  def for_ddwrt?
  	self.router_type == DDWRT
  end

  def for_nocatsplash?
  	self.router_type == NOCATSPLASH
  end

  def for_wifidog?
  	self.router_type == WIFIDOG
  end

  def for_bluesocket?
  	self.router_type == BLUESOCKET
  end
end

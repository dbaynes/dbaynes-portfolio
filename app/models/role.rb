class Role < ActiveRecord::Base
  #has_many_and_belongs_to_many :users
  has_and_belongs_to_many :users
  #belongs_to :users
 end

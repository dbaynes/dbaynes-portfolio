class Portfolio < ActiveRecord::Base
  # attr_accessible :title, :body
  #validates :portfolio_type,  :presence => true
  validates :timeframe, :presence => true,
                       :length => { :minimum => 5 }
  validates :location, :length => {:maximum => 500}       
  validates :experience, :length => {:maximum => 500}       
  
  PORTFOLIO_TYPES = {
    'Arts'          => :arts,
    'Atheletic'     => :atheletic,
    'Education'     => :education,
    'Letters'       => :letters,
    'Professional'  => :professional,
    'Recreational'  => :recreational
  }
  def portfolio_types
     return PORTFOLIO_TYPES
  end
  
  #def to_param
  #  "#{id}-#{portfolio_type.parameterize}"  
  #end         
  
end

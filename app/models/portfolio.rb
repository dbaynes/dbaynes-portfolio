class Portfolio < ActiveRecord::Base
  # attr_accessible :title, :body
  
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
  
end

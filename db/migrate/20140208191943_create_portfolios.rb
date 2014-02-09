class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string        :type,          :limit=>40
      t.string        :timeframe,     :limit=>40      
      t.text          :experience
      t.text          :special_notes 
      t.timestamps
    end
  end
end

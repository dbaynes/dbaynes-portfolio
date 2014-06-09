class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string        :portfolio_name, :limit=>40
      t.string        :portfolio_description, :limit=>200  
      t.string        :image
      t.timestamps
    end
  end
end

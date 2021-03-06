class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string        :portfolio_type, :limit=>40
      t.string        :name,          :limit=>40      
      t.string        :timeframe,     :limit=>40      
      t.string        :location,      :limit=>40      
      t.string        :project_description, :limit=>2000  
      t.timestamps
    end
  end
end

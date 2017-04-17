class AddTimesToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :startdate, :date
  	add_column :events, :enddate, :date
  	add_column :events, :startdatetime, :datetime
  	add_column :events, :enddatetime, :datetime
  end
end

class AddGeoLocationToVisit < ActiveRecord::Migration
  def change
  	add_column :visits, :city, :string
  	add_column :visits, :state, :string
  	add_column :visits, :country, :string
  end
end

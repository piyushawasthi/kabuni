class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id
      t.string :shorten
      t.string :target_url

      t.timestamps
    end
  end
end

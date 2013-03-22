class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :name
      t.integer :magazine_id

      t.timestamps
    end
  end
end

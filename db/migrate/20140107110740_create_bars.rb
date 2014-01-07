class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.belongs_to :foo, index: true

      t.timestamps
    end
  end
end

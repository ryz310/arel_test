class CreateBazs < ActiveRecord::Migration
  def change
    create_table :bazs do |t|
      t.string :name
      t.belongs_to :bar, index: true

      t.timestamps
    end
  end
end

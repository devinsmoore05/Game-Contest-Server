class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.datetime :deadline
      t.datetime :start
      t.text :description
      t.string :name
      t.string :type
      t.references :user, index: true
      t.references :referee, index: true

      t.timestamps
    end
  end
end

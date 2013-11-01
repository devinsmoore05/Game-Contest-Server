class AddContestTypeToContests < ActiveRecord::Migration
  def change
    add_column :contests, :contest_type, :string
  end
end

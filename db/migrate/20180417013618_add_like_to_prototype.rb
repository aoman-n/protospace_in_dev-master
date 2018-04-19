class AddLikeToPrototype < ActiveRecord::Migration
  def change
    add_column :prototypes, :like, :integer
  end
end

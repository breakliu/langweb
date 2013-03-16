class AddTypeIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :type_id, :integer

    add_index :posts, :type_id
    add_index :posts, :id
    add_index :types, :id
  end
end

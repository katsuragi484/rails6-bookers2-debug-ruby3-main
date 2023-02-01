class RemoveFollowIdFromRelationships < ActiveRecord::Migration[6.1]
  def change
    remove_column :relationships, :follow_id, :integer
  end
end

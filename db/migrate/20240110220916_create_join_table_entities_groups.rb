class CreateJoinTableEntitiesGroups < ActiveRecord::Migration[7.1]
  def change
    create_join_table :groups, :entities, id: false do |t|
      t.index [:group_id, :entity_id]
    end
  end
end
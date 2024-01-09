class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :Name
      t.string :Icon

      t.timestamps
    end
  end
end

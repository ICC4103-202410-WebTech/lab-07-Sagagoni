class CreateTableTags < ActiveRecord::Migration[7.1]
  def change
    create_table :table_tags do |t|
      t.string :name
      
      t.timestamps
    end
  end
end

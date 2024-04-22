class AddParentPostToPosts < ActiveRecord::Migration[7.1]
  def change
    change_table :posts do |t|
      t.belongs_to :parent_post, foreign_key: { to_table: :posts }
    end

  end
end

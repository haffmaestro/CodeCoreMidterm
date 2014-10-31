class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|

      t.timestamps
    end
    add_reference :likes, :user, index: true
    add_reference :likes, :idea, index: true
  end
end

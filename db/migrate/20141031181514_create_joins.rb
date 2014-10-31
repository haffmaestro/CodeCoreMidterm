class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|

      t.timestamps
    end
    add_reference :joins, :user, index: true
    add_reference :joins, :idea, index: true
  end
end

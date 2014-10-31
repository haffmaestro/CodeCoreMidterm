class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body

      t.timestamps
    end
    add_reference :comments, :idea, index: true
  end
end

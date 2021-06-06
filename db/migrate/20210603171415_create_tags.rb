class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :tagname
      t.references :todo_item, null: false, foreign_key: true
      t.timestamps
    end
  end
end

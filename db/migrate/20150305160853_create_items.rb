class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.datetime :due_date
      t.boolean :done
      t.belongs_to :list, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :lists
  end
end

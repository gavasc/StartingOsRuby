class CreateIssues < ActiveRecord::Migration[8.0]
  def change
    create_table :issues do |t|
      t.references :repository, null: false, foreign_key: true
      t.string :title
      t.string :link
      t.boolean :open

      t.timestamps
    end
  end
end

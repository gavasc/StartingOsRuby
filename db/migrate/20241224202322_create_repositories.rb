class CreateRepositories < ActiveRecord::Migration[8.0]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
    add_index :repositories, :name, unique: true
  end
end

class AddDescriptionToIssues < ActiveRecord::Migration[8.0]
  def change
    add_column :issues, :description, :text
  end
end

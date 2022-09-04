class AddSlugToToons < ActiveRecord::Migration[7.0]
  def change
    add_column :toons, :slug, :string
    add_index :toons, :slug, unique: true
  end
end

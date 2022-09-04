class CreateToons < ActiveRecord::Migration[7.0]
  def change
    create_table :toons do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :server, null: false
      t.string :klass, null: false
      t.string :primary_spec, null: false
      t.string :secondary_spec

      t.timestamps
    end

    add_index :toons, [:name, :server, :user_id], unique: true
  end
end

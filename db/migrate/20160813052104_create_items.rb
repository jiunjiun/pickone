class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :event, foreign_key: true
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end

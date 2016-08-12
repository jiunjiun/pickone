class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :desc
      t.boolean :is_secret
      t.boolean :is_duplicate
      t.date :over_at

      t.timestamps
    end
  end
end

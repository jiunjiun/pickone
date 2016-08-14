class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :desc
      t.boolean :is_secret,    default: false, commit: '不記名'
      t.boolean :is_duplicate, default: false, commit: '重複投票'
      t.date :over_at,         commit: '截止時間'
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :slug, null: false
      t.timestamp :published_at, default: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps
    end
  end
end

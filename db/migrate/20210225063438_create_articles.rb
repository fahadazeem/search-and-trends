class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :search_count, default: 0
      t.timestamps
    end

    add_index :articles, :title
  end
end

class CreateRhinoPublishedpages < ActiveRecord::Migration[6.1]
  def change
    create_table :rhino_publishedpages do |t|
      t.integer :page_id
      t.text :content
      t.string :title
      t.string :seo_title
      t.string :url

      t.timestamps
    end
  end
end

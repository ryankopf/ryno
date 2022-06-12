class CreateRhinoPages < ActiveRecord::Migration[6.1]
  def change
    create_table :rhino_pages do |t|
      t.blob :blocks_order
      t.string :url
      t.string :title
      t.string :seo_title
      t.string :description
      t.string :redirect_to
      t.string :css_classes

      t.timestamps
    end
  end
end

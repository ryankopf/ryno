class CreateRynoBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :ryno_blocks do |t|
      t.integer :page_id
      t.integer :block_id
      t.blob :blocks_order
      t.string :block_type
      t.string :css_classes
      t.boolean :dont_contain
      t.text :content

      t.timestamps
    end
  end
end

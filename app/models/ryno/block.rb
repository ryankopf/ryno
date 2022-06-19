module Ryno
  class Block < ApplicationRecord
    belongs_to :page, optional: true
    belongs_to :block, optional: true
    has_rich_text :content
    has_many :blocks

    def columns?
      self.block_type == "columns"
    end

  end
end

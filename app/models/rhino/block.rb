module Rhino
  class Block < ApplicationRecord
    belongs_to :page, optional: true
    belongs_to :block, optional: true
    has_rich_text :content
    has_many :blocks

  end
end

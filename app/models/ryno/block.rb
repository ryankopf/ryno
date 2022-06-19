module Ryno
  class Block < ApplicationRecord
    belongs_to :page, optional: true
    belongs_to :block, optional: true
    has_rich_text :content
    has_many :blocks

    def columns?
      self.block_type == "columns"
    end

    def before_element
      self.page.blank? ? "block_#{self.block_id}_blockform" : "page_#{self.page_id}_blockform"
    end

    def parent_element
      self.page.blank? ? "block_#{self.block_id}_blocks" : "page_#{self.page_id}_blocks"
    end

  end
end

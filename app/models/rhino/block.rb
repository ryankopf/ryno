module Rhino
  class Block < ApplicationRecord
    belongs_to :page, optional: true
    belongs_to :block, optional: true
  end
end

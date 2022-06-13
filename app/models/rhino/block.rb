module Rhino
  class Block < ApplicationRecord
    belongs_to :page
    belongs_to :block
  end
end

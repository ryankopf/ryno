module Ryno
  class Publishedpage < ApplicationRecord
    belongs_to :page
    def self.pages
      Publishedpage.pluck(:url,:id).map{|k,y|[k,y]}.inject(Hash.new{ |h,k| h[k]=[] }){ |h,(k,v)| h[k] = v; h }
    end

  end
end

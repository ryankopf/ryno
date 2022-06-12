module Rhino
  class PageConstraint
    def initialize
      @rhino_pages = Publishedpage.pages
    end

    def matches?(request)
      (@rhino_pages.include?(request.path.split("/").second))
    end
  end
end
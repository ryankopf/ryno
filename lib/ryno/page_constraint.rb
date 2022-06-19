module Ryno
  class PageConstraint
    def initialize
      @ryno_pages = Publishedpage.pages
    end

    def matches?(request)
      (@ryno_pages.include?(request.path.split("/").second))
    end
  end
end
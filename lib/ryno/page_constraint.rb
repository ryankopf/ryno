module Ryno
  class PageConstraint
    def initialize
      @ryno_pages = []
      # This is required because you can not run migrations if this throws an error
      if ActiveRecord::Base.connection.data_source_exists?('ryno_publishedpages')
        @ryno_pages = Publishedpage.pages
      end
    end

    def matches?(request)
      (@ryno_pages.include?(request.path.split("/").second))
    end
  end
end
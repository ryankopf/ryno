module Rhino
  class ApplicationController < ::ApplicationController
    def must_be_admin
      begin
        render plain: 'Not available.' unless is_admin?
      rescue
        render plain: 'Not available.'
      end
    end
    def must_be_editor
      begin
        render plain: 'Not available.' unless is_editor?
      rescue
        render plain: 'Not available.'
      end
    end
  end
end

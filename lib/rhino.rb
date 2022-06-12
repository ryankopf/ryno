require "rhino/version"
require "rhino/engine"
require "rhino/tools"
require "rhino/page_constraint"

module Rhino
  ActiveSupport.on_load(:action_controller) do
    # self refers to ActionController::Base here
    # This way is removed because below may be more compatible.
    # self.include Rhino::Tools
    # Would the below be a better (clearer? more compatible?) way to do this?
    ActionController::Base.send(:include, Rhino::Tools)
  end
end

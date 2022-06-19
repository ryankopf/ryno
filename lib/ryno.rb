require "ryno/version"
require "ryno/engine"
require "ryno/tools"
require "ryno/page_constraint"

module Ryno
  ActiveSupport.on_load(:action_controller) do
    # self refers to ActionController::Base here
    # This way is removed because below may be more compatible.
    # self.include Ryno::Tools
    # Would the below be a better (clearer? more compatible?) way to do this?
    ActionController::Base.send(:include, Ryno::Tools)
  end
end

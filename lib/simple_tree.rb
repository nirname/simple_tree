require "simple_tree/view_helpers"

module SimpleTree

  #def self.setup
  #  begin
  #    yield self
  #  end
  #end

  class Engine < Rails::Engine
    # auto wire
    initializer "simple_tree.initialize" do |app|
      ActionView::Base.send :include, SimpleTree::ViewHelpers
    end
  end

  # configure our plugin on boot
  #initializer ".initialize" do |app|
  #  ActionView::Base.send :include, SimpleTree::ViewHelpers
  #end

end

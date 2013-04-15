class TreeController < ApplicationController

  def simple
    render layout: "simple"
  end

  def bootstrap
    render layout: "bootstrap"
  end

end

Dummy::Application.routes.draw do

  get "tree/simple" => "tree#simple"
  get "tree/bootstrap" => "tree#bootstrap"

end

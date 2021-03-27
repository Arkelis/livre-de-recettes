class HomeController < ApplicationController
  def index
    flash.now[:notice] = "Coucou je suis là"
  end

  def about
  end
end

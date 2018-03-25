class WelcomeController < ApplicationController

  def index
    @company = Company.all
  end

end

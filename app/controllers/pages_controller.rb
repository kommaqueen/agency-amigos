class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
      @celebrities = Celebrity.all
  end

end

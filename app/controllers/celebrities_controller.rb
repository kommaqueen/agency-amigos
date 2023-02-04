class CelebritiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_celebrity, only: [:show]

  def index
    @celebrities = Celebrity.all
  end

  def show
  end

  private

  def set_celebrity
    @celebrity = Celebrity.find(params[:id])
  end

end

class CelebritiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_celebrity, only: [:show]

  def index
    @celebrities = Celebrity.all
  end

  def show
  end

  def new
    @celebrity = Celebrity.new
  end

  def create
    @celebrity = Celebrity.new(celebrity_params)
    @celebrity.user = current_user
    if @celebrity.save!
      redirect_to celebrity_path(@celebrity)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_celebrity
    @celebrity = Celebrity.find(params[:id])
  end

  def celebrity_params
    params.require(:celebrity).permit(:name, :category, :description, :daily_rate)
  end
end

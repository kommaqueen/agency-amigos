class CelebritiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_celebrity, only: [:show, :edit, :update, :destroy]

  def index
    @celebrities = Celebrity.all
  end

  def show
    @review = Review.new
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

  def edit
  end

  def update
    @celebrity.update(celebrity_params)
    redirect_to celebrity_path(@celebrity)
  end

  def destroy
    @celebrity.destroy
    redirect_to celebrities_path, status: :see_other
  end

  private

  def set_celebrity
    @celebrity = Celebrity.find(params[:id])
  end

  def celebrity_params
    params.require(:celebrity).permit(:name, :category, :description, :daily_rate, photos: [])
  end
end

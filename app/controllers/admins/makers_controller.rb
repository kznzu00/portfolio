class Admins::MakersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @makers = Maker.all
    @newmaker = Maker.new
  end

  def create
    @newmaker = Maker.new(maker_params)
    if @newmaker.save
      redirect_to admins_makers_path
    else
      @makers = Maker.all
      render :index
    end
  end

  def destroy
    maker = Maker.find(params[:id])
    maker.destroy
    redirect_to admins_makers_path
  end

  def destroy
    @maker = Maker.find(params[:id])
    @maker.destroy
    redirect_to admins_makers_path
  end

  private

  def maker_params
    params.require(:maker).permit(:name)
  end
end

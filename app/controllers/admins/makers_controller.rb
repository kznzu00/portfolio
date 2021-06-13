class Admins::MakersController < ApplicationController
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

  private

  def maker_params
    params.require(:maker).permit(:name)
  end
end

class DosesController < ApplicationController

  before_action :load_cocktail

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def load_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end

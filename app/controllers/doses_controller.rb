class DosesController < ApplicationController

  before_action :set_cocktail

  def create
    # @ingredient = Ingredient.find(dose_params["ingredient"].to_i)
    # @dose = Dose.new(description: dose_params["description"], ingredient: @ingredient, cocktail: @cocktail)
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      raise
      render 'cocktails/show'
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end

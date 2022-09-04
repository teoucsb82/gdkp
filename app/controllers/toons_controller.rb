class ToonsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_toon, only: [:show, :destroy]

  def new
    @toon = Toon.new
  end

  def destroy
    @toon.destroy
    redirect_to profile_url(current_user)
  end

  def create
    @toon = current_user.toons.new(toon_params)

    respond_to do |format|
      if @toon.save
        format.html { redirect_to profile_url(current_user), notice: "toon was successfully created." }
        format.json { render :show, status: :created, location: @toon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @toon.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def load_toon
    @toon = current_user.toons.friendly.find(params[:id])
  end
  
  def toon_params
    params.require(:toon).permit(:name, :server, :klass, :primary_spec, :secondary_spec)
  end  
end

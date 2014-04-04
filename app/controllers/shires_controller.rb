class ShiresController < ApplicationController
  def index
    @shires = Shire.all
    @shire = Shire.new
  end
  def create
    params[:shire][:slug] = params[:shire][:name].parameterize
    params[:shire][:gold] = 100
    # params[:shire][:level] = 0
    @shires = Shire.all
    @shire = Shire.new(params[:shire])
    if @shire.save
      @shire.battalions.create({tower: 0, footman: 0, archer: 0, knight: 0, wizard: 0})
      flash[:notice] = "Added new Shire"
      redirect_to ""
    else
      render "index.html.erb"
    end
  end
  def show
    @shire = Shire.find_by(slug: params[:slug])
    @battalion = @shire.battalions[0]
  end
  def delete
    @shire = Shire.find_by(slug: params[:slug])
    @shire.destroy
    redirect_to ""
  end
end

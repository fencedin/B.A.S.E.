class ShiresController < ApplicationController
  def index
    @shires = Shire.all
    @shire = Shire.new
  end
  def create
    params[:shire][:slug] = params[:shire][:name].parameterize
    params[:shire][:gold] = 100
    @shires = Shire.all
    @shire = Shire.new(params[:shire])
    if @shire.save
      flash[:notice] = "Added new Shire"
      redirect_to ""
    else
      render "index.html.erb"
    end
  end
  def show
    @shire = Shire.find_by(slug: params[:slug])
  end
  def delete
    @shire = Shire.find_by(slug: params[:slug])
    @shire.destroy
    redirect_to ""
  end
end

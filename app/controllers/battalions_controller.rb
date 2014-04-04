class BattalionsController < ApplicationController
  def update
    @shire = Shire.find_by(slug: params[:slug])
    @battalion = @shire.battalions[0]

    @battalion.buy(params[:battalion])
    redirect_to "/shires/#{@shire.slug}"
  end
end

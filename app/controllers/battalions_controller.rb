class BattalionsController < ApplicationController
  def update
    @shire = Shire.find_by(slug: params[:slug])
    @battalion = @shire.battalions[0]

    if params[:battalion].include?("tower") && @shire.gold >= 100
      @battalion.update(params[:battalion])
      @shire.update({gold: @shire.gold-100})
    elsif params[:battalion].include?("footman") && @shire.gold >= 10
      @battalion.update(params[:battalion])
      @shire.update({gold: @shire.gold-10})
    elsif params[:battalion].include?("archer") && @shire.gold >= 25
      @battalion.update(params[:battalion])
      @shire.update({gold: @shire.gold-25})
    elsif params[:battalion].include?("knight") && @shire.gold >= 50
      @battalion.update(params[:battalion])
      @shire.update({gold: @shire.gold-50})
    elsif params[:battalion].include?("wizard") && @shire.gold >= 300
      @battalion.update(params[:battalion])
      @shire.update({gold: @shire.gold-300})
    end
    redirect_to "/shires/#{@shire.slug}"
  end
end

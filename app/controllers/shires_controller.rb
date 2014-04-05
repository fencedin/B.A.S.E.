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
    @shires_to_attack = Shire.all - [@shire]
    @battalion = @shire.battalions[0]
  end
  def delete
    @shire = Shire.find_by(slug: params[:slug])
    @shire.destroy
    redirect_to ""
  end
  def update
    @shire = Shire.find_by(slug: params[:slug])
    @attacking = @shire.battalions[0]
    @shire_2 = Shire.find_by(slug: params[:attack][":slug"])
    @defending = @shire_2.battalions[0]
    if @shire.events[-1].updated_at+10 < Time.now
      attacking_power = @attacking.footman+(@attacking.knight*10)+(@attacking.archer*3.5)+(@attacking.wizard*35)
      defending_power = (@defending.footman*1.1)+(@defending.tower*20)+(@defending.archer*5)+(@defending.wizard*35)

      if attacking_power > defending_power
        @attacking.update({footman: (@attacking.footman*0.9).floor, knight: (@attacking.knight*0.9).floor, archer: (@attacking.archer*0.9).floor, wizard: (@attacking.wizard)})
        @defending.update({footman: (@defending.footman*0.7).floor, tower: (@defending.tower*0.8).floor, archer: (@defending.archer*0.7).floor, wizard: (@defending.wizard*0.5).floor})
        defender_gold = @shire_2.gold
        attacker_gold = @shire.gold
        @shire.update({gold: (attacker_gold+ defender_gold*0.15).floor})
        @shire_2.update({gold: (defender_gold*0.85).floor})
        @shire.events.create(name: "You Won, gaining #{(defender_gold*0.15).floor} gold!")
        flash[:notice] = "You Won, gaining #{(defender_gold*0.15).floor} gold!"
      else
        @attacking.update({footman: (@attacking.footman*0.7).floor, knight: (@attacking.knight*0.7).floor, archer: (@attacking.archer*0.7).floor, wizard: (@attacking.wizard*0.5).floor})
        @defending.update({footman: (@defending.footman*0.9).floor, tower: (@defending.tower*0.9).floor, archer: (@defending.archer*0.9).floor, wizard: (@defending.wizard)})
        @shire.events.create(name: "You Lost")
        flash[:notice] = "You Lost"
      end
    else
      flash[:notice] = "NOOOOOOO"
    end
    redirect_to "/shires/#{@shire.slug}"
  end
end

class Battalion < ActiveRecord::Base
  has_and_belongs_to_many :shires

def buy(unit)
  shire = self.shires[0]
    if unit.include?(":gold")
      shire.update({gold: shire.gold+100})
    else
      if unit.include?("tower") && shire.gold >= 100
        self.update(unit)
        shire.update({gold: shire.gold-100})
      elsif unit.include?("footman") && shire.gold >= 10
        self.update(unit)
        shire.update({gold: shire.gold-10})
      elsif unit.include?("archer") && shire.gold >= 25
        self.update(unit)
        shire.update({gold: shire.gold-25})
      elsif unit.include?("knight") && shire.gold >= 50
        self.update(unit)
        shire.update({gold: shire.gold-50})
      elsif unit.include?("wizard") && shire.gold >= 300
        self.update(unit)
        shire.update({gold: shire.gold-300})
      end
    end
  end

end

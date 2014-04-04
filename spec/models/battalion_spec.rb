require 'spec_helper'

describe Battalion do
  it { should have_and_belong_to_many :shires }

  context '#buy' do
    it 'buys a unit' do
      shire = Shire.create(name: 'shiretest', gold: 500)
      battalion = shire.battalions.create(wizard: 0)
      battalion.buy({"wizard" => 1})
      battalion.wizard.should eq 1
      shire.reload
      shire.gold.should eq 200
    end
  end
end

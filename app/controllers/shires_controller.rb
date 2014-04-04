class ShiresController < ApplicationController
  def index
    @shires = Shire.all
  end
end

require 'spec_helper'

describe Battalion do
  it { should have_and_belong_to_many :shires }
end

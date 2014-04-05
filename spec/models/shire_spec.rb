require 'spec_helper'

describe Shire do
  it { should have_and_belong_to_many :battalions }
  it { should have_many :events }
  it { should validate_presence_of :name}
  it { should validate_uniqueness_of :name}

end

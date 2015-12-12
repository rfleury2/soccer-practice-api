require 'rails_helper'

RSpec.describe League, type: :model do
  it { should have_many(:teams) }
  it { should have_many(:seasons) }
  it { should have_many(:games) }

  it { should validate_presence_of(:country) }

	it do
    should validate_inclusion_of(:country).
      in_array(%w(england germany holland italy spain))
  end

end

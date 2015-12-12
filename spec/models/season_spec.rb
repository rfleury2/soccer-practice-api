require 'rails_helper'

RSpec.describe Season, type: :model do
  it { should have_many(:games) }

  it { should belong_to(:league) }
  
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:division) }
end

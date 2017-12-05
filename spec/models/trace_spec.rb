require 'rails_helper'

# Test suite for the Trace model
RSpec.describe Trace, type: :model do
  # Validation tests
  # ensure columns latitude and longitude are present before saving
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
end

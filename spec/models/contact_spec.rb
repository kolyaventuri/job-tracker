require 'rails_helper'

describe Contact, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:role) }
  it { is_expected.to validate_presence_of(:email) }

  it { is_expected.to belong_to(:company) }
end
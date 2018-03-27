require 'rails_helper'

describe Comment, type: :model do
  it { is_expected.to validate_presence_of(:comment) }
  it { is_expected.to belong_to(:job) }
end

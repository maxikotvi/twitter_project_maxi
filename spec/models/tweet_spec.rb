require 'rails_helper'

RSpec.describe Tweet, type: :model do

  subject(:tweet) { build(:tweet) }

  describe 'Associations' do
    it { is_expected.to have_many(:favorites).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:favorites) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :number }
    it { is_expected.to validate_uniqueness_of :number }
  end

end

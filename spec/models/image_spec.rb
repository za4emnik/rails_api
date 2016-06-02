require 'rails_helper'

RSpec.describe Image, type: :model do
  subject { build :image }
    describe 'validations' do
      it { is_expected.to validate_presence_of :user_id  }
      it { is_expected.to validate_presence_of :image  }
    end

    describe 'associations' do
      it { is_expected.to belong_to :user }
    end
end

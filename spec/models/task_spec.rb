require 'rails_helper'

RSpec.describe Task, type: :model do
  subject { build :task }
    describe 'validations' do
      it { is_expected.to validate_presence_of :user   }
      it { is_expected.to validate_presence_of :image_id   }
      it { is_expected.to validate_presence_of :params   }
      it { is_expected.to validate_presence_of :task_type   }
    end

    describe 'associations' do
      it { is_expected.to belong_to :user }
      it { is_expected.to belong_to :image }
    end
end

# frozen_string_literal: true

describe Contact, type: :model do
  EMAIL = 'email@example.com'.freeze

  context 'validations' do
    describe '#name' do
      it { is_expected.to validate_presence_of(:name) }
    end

    describe '#email' do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to allow_value(EMAIL).for(:email) }
      it { is_expected.to_not allow_value('I am not an email!').for(:email) }
    end
  end
end

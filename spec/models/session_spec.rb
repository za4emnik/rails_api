require 'rails_helper'

RSpec.describe Session, type: :model do
  subject(:session) { build :session }

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of :token }
    it { is_expected.to validate_presence_of   :user_id  }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
  end

  describe '.auth' do
    subject(:session) { Session.auth(auth_email, auth_password) }

    let!(:user)    { create :user, name: name, email: email, password: password }
    let(:name) { 'UserName' }
    let(:password) { 'password' }
    let(:email   ) { 'mail@example.com' }
    let(:auth_password) { password }
    let(:auth_email)    { email    }

    context 'with valid credentials' do
      it 'is to authorize user by valid email and password' do
        expect(session.persisted?).to be_truthy
        is_expected.to be_a Session
        expect(session.user).to eql user
      end
      end

      context 'with invalid email' do
        let(:auth_email) { 'wrong_email' }
        it 'is expect to raise exception' do
          expect { session }.to raise_exception(UnauthorizedError)
        end
      end

      context 'with invalid password' do
        let(:auth_password) { 'wrong_password' }
        it 'is expect to raise exception' do
          expect { session }.to raise_exception(UnauthorizedError)
        end
      end
    end
  end

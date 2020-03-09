# frozen_string_literal: true

require './administration/user_creator'

RSpec.describe Administration::UserCreator do
  describe '#call' do
    let(:name) { 'name' }
    let(:email) { 'email' }
    let(:password) { 'password' }
    let(:creatoe) { described_class.new(name: name, email: email, password: password, type: type) }

    subject { creatoe.call }

    context 'when creating a student' do
      let(:type) { :student }

      it 'creates a student' do
        student = subject
        expect(student.id).to_not be_nil
        expect(student.name).to eq(name)
        expect(student.email).to eq(email)
        expect(student.password).to eq(password)
        expect(student.type).to eq(Authentication::User::TYPES[:student])
      end
    end

    context 'when creating a staff member' do
      let(:type) { :staff }

      it 'creates a staff' do
        staff = subject
        expect(staff.id).to_not be_nil
        expect(staff.name).to eq(name)
        expect(staff.email).to eq(email)
        expect(staff.password).to eq(password)
        expect(staff.type).to eq(Authentication::User::TYPES[:staff])
      end
    end

    context 'when creating a admin' do
      let(:type) { :admin }

      it 'creates a admin' do
        admin = subject
        expect(admin.id).to_not be_nil
        expect(admin.name).to eq(name)
        expect(admin.email).to eq(email)
        expect(admin.password).to eq(password)
        expect(admin.type).to eq(Authentication::User::TYPES[:admin])
      end
    end
  end
end

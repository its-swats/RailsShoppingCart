require 'rails_helper'

RSpec.describe User, type: :model do

  let(:good_user) {User.new(first_name: 'First', last_name: "Last", email: "gmail", password: "password")}
  let(:user_no_first) {User.new(last_name: "Last", email: "gmail", password: "password")}
  let(:user_no_last) {User.new(first_name: 'First', email: "gmail", password: "password")}
  let(:user_no_email) {User.new(first_name: 'First', last_name: "Last", password: "password")}
  let(:user_no_password) {User.new(first_name: 'First', last_name: "Last", email: "gmail")}

  describe 'validations' do
    context 'will raise an error' do
      it 'when the first name is missing' do
        user_no_first.save
        expect(user_no_first.errors[:first_name]).to include("can't be blank")
      end
      it 'when the last name is missing' do
        user_no_last.save
        expect(user_no_last.errors[:last_name]).to include("can't be blank")
      end
      it 'when the email is missing' do
        user_no_email.save
        expect(user_no_email.errors[:email]).to include("can't be blank")
      end
      it 'when the password is missing' do
        user_no_password.save
        expect(user_no_password.errors[:password]).to include("can't be blank")
      end
    end
    context 'it will successfully save when' do
      it 'saves when all fields are present' do
        expect{good_user.save}.to change{User.count}.by(1)
      end
    end
  end
end

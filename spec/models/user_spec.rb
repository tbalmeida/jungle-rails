require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(first_name: "John",
                        last_name: "Doe",
                        email: 'johndoe@email.com',
                        password: "password",
                        password_confirmation: "password")
  }

  describe 'Validations' do

    # it "Is valid with all attributes" do
    #   expect(subject).to be_valid
    #   puts "Is valid with all attributes\n    Errors: #{subject.errors.full_messages}" if subject.errors.count > 0
    # end

    # it "Should fail without the first name" do
    #   subject.first_name = nil
    #   expect(subject).not_to be_valid
    #   puts "Should fail without the first name\n    Errors: #{subject.errors.full_messages}" if subject.errors.count > 0
    # end

    # it "Should fail without the last name" do
    #   subject.last_name = nil
    #   expect(subject).not_to be_valid
    #   puts "Should fail without the last name\n    Errors: #{subject.errors.full_messages}" if subject.errors.count > 0
    # end

    # it "Should fail without a password" do
    #   subject.password = nil
    #   expect(subject).not_to be_valid
    #   puts "Should fail without a password\n    Errors: #{subject.errors.full_messages}" if subject.errors.count > 0
    # end

    # it "Should fail without the password confirmation" do
    #   subject.password_confirmation = nil
    #   expect(subject.password_confirmation).not_to be_present
    #   puts "Should fail without the password confirmation\n    Errors: #{subject.errors.full_messages}" if subject.errors.count > 0
    # end

    # it "Password length should be >= 5" do
    #   subject.password = nil
    #   expect(subject.password.length).to be >= 5
    #   puts "Password length should be >= 5\n    Errors: #{subject.errors.full_messages}" if subject.errors.count > 0
    # end

    it "Password won't match" do
@newUser = User.create(
  first_name: "John",
  last_name: "Doe",
  email: "this@gmail",
  password: "secure",
  password_confirmation: "notsecure")


puts "newUSer", @newUser
      # subject.password_confirmation = "notthesame"
      expect(@newUser.errors[:password_confirmation].first).to eq ("doesn't match Password")
      puts "Should fail without the password confirmation\n    Errors: #{subject.errors.full_messages}" if subject.errors.count > 0
    end

  end


end

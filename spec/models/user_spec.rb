require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "Is valid with all attributes" do
      @user = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "this@gmail.com",
        password: "secure",
        password_confirmation: "secure")
      expect(@user).to be_valid
      puts "Is valid with all attributes\n    Errors: #{@user.errors.full_messages}" if @user.errors.count > 0
    end

    it "Should fail without the first name" do
      @user = User.create(
        first_name: nil,
        last_name: "Doe",
        email: "this@gmail",
        password: "secure",
        password_confirmation: "secure")
      expect(@user).to be_invalid
      puts "Should fail without the first name\n    Errors: #{@user.errors.full_messages}" if @user.errors.count > 0
    end

    it "Should fail without the last name" do
      @user = User.create(
        first_name: "John",
        last_name: nil,
        email: "this@gmail",
        password: "secure",
        password_confirmation: "secure")
      expect(@user).to be_invalid
      puts "Should fail without the last name\n    Errors: #{@user.errors.full_messages}" if @user.errors.count > 0
    end

    it "Should fail without a password" do
      @user = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "this@gmail",
        password: nil,
        password_confirmation: "secure")
      expect(@user).to be_invalid
      puts "Should fail without a password\n    Errors: #{@user.errors.full_messages}" if @user.errors.count > 0
    end

    it "Password length should be >= 5" do
      @user = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "this@gmail",
        password: "secure",
        password_confirmation: "secure")
      expect(@user.password.length).to be >= 5
      puts "Password length should be >= 5\n    Errors: #{@user.errors.full_messages}" if @user.errors.count > 0
    end

    it "Password won't match" do
      @user = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "this@gmail",
        password: "secure",
        password_confirmation: "notsecure")
      expect(@user.errors[:password_confirmation].first).to eq ("doesn't match Password")
      puts "Password won't match\n    Errors: #{@user.errors.full_messages}" if @user.errors.count > 0
    end

  end

  describe "Edge Cases" do
    it "Should authenticate even with spaces before/after email" do
      @user = User.create(
        first_name: "John",
        last_name: "Doe",
        email: "this@gmail",
        password: "secure",
        password_confirmation: "secure")
      @login = User.authenticate_with_credentials("  This@GMail  ", "secure")  
      expect(@login).not_to be_nil
      # puts "Password length should be >= 5\n    Errors: #{@user.errors.full_messages}" if @user.errors.count > 0
    end

  end

end

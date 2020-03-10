require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
  # validates: name, presence: true
  # validates price, presence true
  # validates quantity, presence true
  # validates category, presence true
  cat = Category.find_or_create_by! name: 'Furniture'

  subject {
    described_class.new(name: "Product name",
                        description: "Product description",
                        image: 'apparel1.jpg',
                        price_cents: 400,
                        quantity: 1,
                        category: cat)
  }

    it "Is valid with all attributes" do
      expect(subject).to be_valid
      puts "Is valid with all attributes\n    Errors: #{subject.errors.full_messages}" if subject.errors.count > 0
    end

    it "has a name" do
      subject.name = nil
      expect(subject).not_to be_valid
      puts "It should have a name\n    Errors: #{subject.errors.full_messages}" if subject.errors.count > 0
    end

    it "It should have a price" do
      subject.price_cents = nil
      expect(subject).not_to be_valid
      puts "It should have a price\n    Errors: #{subject.errors.full_messages}" if subject.errors.count > 0
    end

    it "It should have a quantity > 0" do
      subject.quantity = nil
      expect(subject).not_to be_valid
      puts "It should have a quantity\n    Errors: #{subject.errors.full_messages}" if subject.errors.count > 0
    end

    it "has a category defined" do
      subject.category = nil
      expect(subject).not_to be_valid
      puts "It should have a category defined\n    Errors: #{subject.errors.full_messages}" if subject.errors.count > 0
    end

  end
end
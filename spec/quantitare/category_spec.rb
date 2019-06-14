require 'spec_helper'

RSpec.describe Quantitare::Category do
  class Quantitare::Categories::Test < Quantitare::Category
    specification do
      required(:name).filled(:string)
    end
  end

  describe '.name=' do
    before { @previous_name = Quantitare::Categories::Test.name }
    after { Quantitare::Categories::Test.name = @previous_name }

    it 'sets the name of the class' do
      Quantitare::Categories::Test.name = 'some_name_1'

      expect(Quantitare::Categories::Test.name).to eq('some_name_1')
    end

    it 'sets the lookup to the given value' do
      Quantitare::Categories::Test.name = 'some_name_2'

      expect(Quantitare::Category['some_name_2']).to eq(Quantitare::Categories::Test)
    end

    it 'removes the previous lookup' do
      Quantitare::Categories::Test.name = 'some_name_3'

      expect(Quantitare::Category[@previous_name]).to be_nil
    end
  end

  describe '.get' do
    it 'returns the root category if the name is not found' do
      expect(Quantitare::Category.get('some_nonsense_1234')).to eq(Quantitare::Category)
    end

    it 'returns the root category when retrieved from a subclass' do
      expect(Quantitare::Categories::Test.get('some_nonsense_1234')).to eq(Quantitare::Category)
    end

    it 'returns the correct category when selected by name' do
      expect(Quantitare::Category.get('test')).to eq(Quantitare::Categories::Test)
    end

    it 'returns the correct category when retrieved from a subclass' do
      expect(Quantitare::Categories::Test.get('test')).to eq(Quantitare::Categories::Test)
    end
  end

  describe '.default' do
    it 'returns the root category' do
      expect(Quantitare::Category.default).to eq(Quantitare::Category)
    end

    it 'can be retrieved from a subclass' do
      expect(Quantitare::Categories::Test.default).to eq(Quantitare::Category)
    end
  end

  describe '#name' do
    it 'pulls the name from the superclass' do
      expect(Quantitare::Categories::Test.new({}).name).to eq('test')
    end
  end

  describe '#valid?' do
    it 'returns true for valid input' do
      expect(Quantitare::Categories::Test.new(name: 'name_1').valid?).to be(true)
    end

    it 'returns false for blank input' do
      expect(Quantitare::Categories::Test.new({}).valid?).to be(false)
    end

    it 'returns false for invalid input' do
      expect(Quantitare::Categories::Test.new(name: '').valid?).to be(false)
    end
  end
end

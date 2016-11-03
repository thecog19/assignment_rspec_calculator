require 'spec_helper'

describe Calculator do
  let(:calc) { Calculator.new }

  describe '#add' do
    it 'adds two nums together' do
      expect(calc.add(1,2)).to eq(3)
    end

    it 'adds negative numbers' do
      expect(calc.add(-4,-2)).to eq(-6)
    end
  end

  describe '#subtract' do
    it 'subtracts two numbers from eachother' do
      expect(calc.subtract(8,4)).to eq(4)
    end
  end

  describe '#multiply' do
    it 'multiplies two numbers' do
      expect(calc.multiply(4,4)).to eq(16)
    end
  end

  describe '#divide' do
    it 'divides two numbers' do
      expect(calc.divide(16,4)).to eq(4)
    end

    it 'raises argument error if b.zero?' do
      expect{ calc.divide(16, 0) }.to raise_error(ArgumentError)
    end

  end

  describe '#pow' do
    it 'returns a to power b' do
      expect(calc.pow(8,2)).to eq(64)
    end
  end

  describe '#sqrt' do
    it 'returns the square root of the parameter' do
      expect(calc.sqrt(16)).to eq(4)
    end

    it 'raises argument error if parameter is less than 0' do
      expect { calc.sqrt(-1) }.to raise_error(ArgumentError)
    end

  end

  describe '#memory' do
    it 'returns nil if nothing is stored' do
      expect(calc.memory).to eq(nil)
    end

    it 'returns value if present' do
      calc.memory=('asdf')
      expect(calc.memory).to eq('asdf')
    end

    it 'deletes old value' do
      calc.memory=('asdf')
      calc.memory
      expect(calc.memory).to eq(nil)
    end

  end


end

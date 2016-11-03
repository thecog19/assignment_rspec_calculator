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

    it 'adds floats together' do
        expect(calc.add(0.4, 0.3)).to be_within(0.01).of(0.7)
    end

    it 'adds negative floats together' do
        expect(calc.add(0.4, -0.3)).to be_within(0.01).of(0.1)
    end
  end

  describe '#subtract' do
    it 'subtracts two numbers from eachother' do
      expect(calc.subtract(8,4)).to eq(4)
    end

    it 'subtracts two negative number from eachother' do
      expect(calc.subtract(-1,-3)).to eq(2)
    end

    it 'subtracts floats' do
        expect(calc.subtract(0.4, 0.3)).to be_within(0.01).of(0.1)
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

    it "returns a float if there is a remainder" do
      expect(calc.divide(5.0, 3)).to be_kind_of(Float)
    end

  end

  describe '#pow' do
    it 'returns a to power b' do
      expect(calc.pow(8,2)).to eq(64)
    end

    it 'returns a to power b if negative' do
      expect(calc.pow(-3,3)).to eq(-27)
    end

    it 'returns a to power b if decimal' do
      expect(calc.pow(1.1,2)).to be_within(0.01).of(1.21)
    end
  end

  describe '#sqrt' do
    it 'returns the square root of the parameter' do
      expect(calc.sqrt(16)).to eq(4)
    end

    it 'raises argument error if parameter is less than 0' do
      expect { calc.sqrt(-1) }.to raise_error(ArgumentError)
    end

    it 'returns a rounded number' do
      expect(calc.sqrt(2)).to eq(1.41)
    end

  end

  describe '#memory=' do
    it 'stores a value' do
      calc.memory=('asdf')
      expect(calc.instance_variable_get( :@memory)).to eq('asdf')
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

  describe '#output' do
    it "returns the original parameter" do
      expect(calc.output(10)).to eq(10)
    end

    it "returns parameter as string" do
      expect(Calculator.new(true).output(10)).to eq("10")
    end
  end
end

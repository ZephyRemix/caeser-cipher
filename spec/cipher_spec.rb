require_relative '../cipher.rb'

describe Cipher do

  describe '#normalize_shift_factor' do
    subject(:cipher) { described_class.new('test', shift_factor) }

    context "when given a shift factor lower than length of letter array" do
      let(:shift_factor) { 1 }

      it 'returns the same shift value' do
        expect{ cipher.normalize_shift_factor}.to_not change { cipher.instance_variable_get(:@shift_factor) }
      end
    end

    context "when given a shift factor larger than length of letter array" do
      let(:shift_factor) { 30 }

      it 'returns a normalized value' do
        expect{ cipher.normalize_shift_factor }.to change { cipher.instance_variable_get(:@shift_factor) }.from(30).to(4)
      end
    end
  end

  describe '#encrypt_message' do
    context 'when encrpyting a string with letters of upper and lower casings, and non-alphabets' do
      subject(:cipher) { described_class.new('"What a string!123"', 5) }

      it 'returns a string preserving casing and non-alphabets' do
        expect(cipher.encrypt_message).to eql('"Bmfy f xywnsl!123"')
      end
    end

    context 'when encrpyting an empty string' do
      subject(:cipher) { described_class.new('', 5) }

      it 'returns an empty string' do
        expect(cipher.encrypt_message).to eql('')
      end
    end

    context 'when encrpyting with shift factor of 0' do
      subject(:cipher) { described_class.new('What a string!123', 0) }

      it 'returns the original string' do
        expect(cipher.encrypt_message).to eql('What a string!123')
      end
    end
  end
end


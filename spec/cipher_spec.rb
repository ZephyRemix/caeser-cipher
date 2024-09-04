require_relative '../cipher.rb'

describe Cipher do

  describe '#normalize_shift_factor' do
    context "when given a shift factor lower than length of letter array" do
      subject(:cipher) { described_class.new('test', 1) }

      it 'returns the same shift value' do
        expect{ cipher.normalize_shift_factor}.to_not change { cipher.instance_variable_get(:@shift_factor) }
      end
    end

    context "when given a shift factor larger than length of letter array" do
      subject(:cipher) { described_class.new('test', 30) }

      it 'returns a normalized value' do
        normalized_val = 30 - cipher.instance_variable_get(:@cipher_dict).size
        expect{ cipher.normalize_shift_factor }.to change { cipher.instance_variable_get(:@shift_factor) }.from(30).to(normalized_val)
      end
    end
  end

  describe '#encrypt_message' do
    context 'when encrpyting a string with letters of upper and lower casings, and non-alphabets' do
      subject(:cipher_encrypt) { described_class.new('"What a string!123"', 5) }

      it 'returns a string preserving casing and non-alphabets' do
        expect(cipher_encrypt.encrypt_message).to eql('"Bmfy f xywnsl!123"')
      end
    end
  end
end

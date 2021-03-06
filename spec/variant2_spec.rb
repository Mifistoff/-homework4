require 'spec_helper'

describe Hash do
  let(:hash_with_num_key) { { 1 => 'one' } }
  let(:hash_with_str_key) { { 'a' => 'one' } }
  let(:test_block) { ->(key) { key * 2 } }
  let(:error_block) { -> { hash_with_num_key.assert_valid_keys(0) } }

  describe '#transform_keys' do
    it 'Returns a new hash with all keys converted using the block operation' do
      expect do
        (hash_with_num_key.transform_keys test_block).to eq(2 => 'one')
      end
    end
  end

  describe '#transform_keys!' do
    it 'Destructively converts all keys using the block operations.' do
      hash_with_num_key.transform_keys!(&test_block)
      expect(hash_with_num_key).to eq(2 => 'one')
    end
  end

  describe '#stringify_keys' do
    it 'Returns a new hash with all keys converted to strings' do
      expect(hash_with_num_key.stringify_keys).to eq('1' => 'one')
    end
  end

  describe '#stringify_keys!' do
    it 'Destructively converts all keys to strings' do
      hash_with_num_key.stringify_keys!
      expect(hash_with_num_key).to eq('1' => 'one')
    end
  end

  describe '#symbolize_keys' do
    it 'Returns a new hash with all keys converted to symbols' do
      expect(hash_with_str_key.symbolize_keys).to eq(a: 'one')
    end
  end

  describe '#symbolize_keys!' do
    it 'Destructively converts all keys to symbols' do
      hash_with_str_key.symbolize_keys!
      expect(hash_with_str_key).to eq(a: 'one')
    end
  end

  describe '#assert_valid_keys' do
    it 'raising ArgumentError on a mismatch validates keys on parameters' do
      expect(hash_with_num_key.assert_valid_keys(1)).to eq(hash_with_num_key)
      expect(error_block).to raise_error(ArgumentError)
    end
  end

  describe '#deep_transform_keys' do
    it 'Returns a new hash with all keys converted by the block operation' do
      expect do
        hash_with_num_key.deep_transform_keys test_block.to eq(2 => 'one')
      end
    end
  end

  describe '#deep_transform_keys!' do
    it 'Destructively converts all keys by using the block operation' do
      hash_with_num_key.deep_transform_keys!(&test_block)
      expect(hash_with_num_key).to eq(2 => 'one')
    end
  end

  describe '#deep_stringify_keys' do
    it 'Returns a new hash with all keys converted to strings' do
      expect(hash_with_num_key.deep_stringify_keys).to eq('1' => 'one')
    end
  end

  describe '#deep_stringify_keys!' do
    it 'Destructively converts all keys to strings' do
      hash_with_num_key.deep_stringify_keys!
      expect(hash_with_num_key).to eq('1' => 'one')
    end
  end

  describe '#deep_symbolize_keys' do
    it 'Returns a new hash with all keys converted to symbols' do
      expect(hash_with_str_key.deep_symbolize_keys).to eq(a: 'one')
    end
  end

  describe '#deep_symbolize_keys!' do
    it 'Destructively converts all keys to symbols' do
      hash_with_str_key.deep_symbolize_keys!
      expect(hash_with_str_key).to eq(a: 'one')
    end
  end
end

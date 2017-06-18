# for the second plus

require 'test_helper'

class HashTest < Minitest::Spec
  let(:hash_with_num_key) { { 1 => 'one' } }
  let(:hash_with_str_key) { { 'a' => 'one' } }
  let(:simply_block) { ->(key) { key * 2 } }
  let(:error_block) { -> { hash_with_num_key.assert_valid_keys(0) } }

  describe '#transform_keys' do
    it 'Returns a new hash with all keys converted using the block operation' do
      hash_with_num_key.transform_keys(&simply_block).must_equal(2 => 'one')
    end
  end

  describe '#transform_keys!' do
    it 'Destructively converts all keys using the block operations.' do
      hash_with_num_key.transform_keys!(&simply_block)
      hash_with_num_key.must_equal(2 => 'one')
    end
  end

  describe '#stringify_keys' do
    it 'Returns a new hash with all keys converted to strings' do
      hash_with_num_key.stringify_keys.must_equal('1' => 'one')
    end
  end

  describe '#stringify_keys!' do
    it 'Destructively converts all keys to strings' do
      hash_with_num_key.stringify_keys!
      hash_with_num_key.must_equal('1' => 'one')
    end
  end

  describe '#symbolize_keys' do
    it 'Returns a new hash with all keys converted to symbols' do
      hash_with_str_key.symbolize_keys.must_equal(a: 'one')
    end
  end

  describe '#symbolize_keys!' do
    it 'Destructively converts all keys to symbols' do
      hash_with_str_key.symbolize_keys!
      hash_with_str_key.must_equal(a: 'one')
    end
  end

  describe '#assert_valid_keys' do
    it 'raising ArgumentError on a mismatch validates keys on parameters' do
      hash_with_num_key.assert_valid_keys(1).must_equal(hash_with_num_key)
      error_block.must_raise(ArgumentError)
    end
  end

  describe '#deep_transform_keys' do
    it 'Returns a new hash with all keys converted by the block operation' do
      hash_with_num_key.deep_transform_keys(&simply_block).must_equal(2 => 'one')
    end
  end

  describe '#deep_transform_keys!' do
    it 'Destructively converts all keys by using the block operation' do
      hash_with_num_key.deep_transform_keys!(&simply_block)
      hash_with_num_key.must_equal(2 => 'one')
    end
  end

  describe '#deep_stringify_keys' do
    it 'Returns a new hash with all keys converted to strings' do
      hash_with_num_key.deep_stringify_keys.must_equal('1' => 'one')
    end
  end

  describe '#deep_stringify_keys!' do
    it 'Destructively converts all keys to strings' do
      hash_with_num_key.deep_stringify_keys!
      hash_with_num_key.must_equal('1' => 'one')
    end
  end

  describe '#deep_symbolize_keys' do
    it 'Returns a new hash with all keys converted to symbols' do
      hash_with_str_key.deep_symbolize_keys.must_equal(a: 'one')
    end
  end

  describe '#deep_symbolize_keys!' do
    it 'Destructively converts all keys to symbols' do
      hash_with_str_key.deep_symbolize_keys!
      hash_with_str_key.must_equal(a: 'one')
    end
  end
end

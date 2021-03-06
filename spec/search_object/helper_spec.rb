require 'spec_helper'

module SearchObject
  describe Helper do
    describe '.stringify_keys' do
      it 'converts hash keys to strings' do
        hash = Helper.stringify_keys a: 1, b: nil, c: false
        expect(hash).to eq 'a' => 1, 'b' => nil, 'c' => false
      end
    end

    describe '.select_keys' do
      it 'selects only given keys' do
        hash = Helper.select_keys({ a: 1, b: 2, c: 3 }, [:a, :b])
        expect(hash).to eq a: 1, b: 2
      end

      it 'ignores not existing keys' do
        hash = Helper.select_keys({}, [:a, :b])
        expect(hash).to eq({})
      end
    end

    describe 'camelize' do
      it "transforms :paging to 'Paging'" do
        expect(Helper.camelize(:paging)).to eq 'Paging'
      end
    end

    describe 'deep_copy' do
      it 'returns a deep copy on the given object' do
        original = {
          array: [1, 2, 3],
          hash: { key: 'value' },
          boolean: true,
          number: 1,
          null: nil
        }

        deep_copy = Helper.deep_copy(original)

        original[:array][0] = 42
        original[:hash][:key] = 'other value'

        expect(deep_copy).to eq(
          array: [1, 2, 3],
          hash: { key: 'value' },
          boolean: true,
          number: 1,
          null: nil
        )
      end
    end
  end
end

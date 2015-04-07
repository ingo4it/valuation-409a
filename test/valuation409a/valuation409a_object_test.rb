require File.expand_path('../../test_helper', __FILE__)

module Valuation409a
  class Valuation409aObjectTest < Test::Unit::TestCase
    should "implement #respond_to correctly" do
      obj = Valuation409a::Valuation409aObject.construct_from({ :id => 1, :foo => 'bar' })
      assert obj.respond_to?(:id)
      assert obj.respond_to?(:foo)
      assert !obj.respond_to?(:baz)
    end

    should "marshal a valuation409a object correctly" do
      obj = Valuation409a::Valuation409aObject.construct_from({ :id => 1, :name => 'Valuation409a' }, 'apikey')
      m = Marshal.load(Marshal.dump(obj))
      assert_equal 1, m.id
      assert_equal 'Valuation409a', m.name
      assert_equal 'apikey', m.api_key
    end

    should "recursively call to_hash on its values" do
      nested = Valuation409a::Valuation409aObject.construct_from({ :id => 7, :foo => 'bar' })
      obj = Valuation409a::Valuation409aObject.construct_from({ :id => 1, :nested => nested })
      expected_hash = { :id => 1, :nested => { :id => 7, :foo => 'bar' } }
      assert_equal expected_hash, obj.to_hash
    end
  end
end

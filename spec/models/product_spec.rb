require_relative "../../lib/models/product"
require 'spec_helper'

RSpec.describe Product do
  let (:product) { Product.new(123, "Test Product", 2000)}

  # Should have valid attributes
  it 'should be valid with a uuid' do
    expect(product.uuid).to eq 123
  end

  it 'should be valid with a name' do
    expect(product.name).to eq 'Test Product'
  end

  it 'should be valid with a price' do
    expect(product.price).to eq 2000
  end

  # Should be able to update product attributes
  it 'should be able to update name' do
    product.update_name('New Name')
    expect(product.name).to eq 'New Name'
  end

  it 'should be able to update price' do
    product.update_price(3000)
    expect(product.price).to eq 3000
  end
end

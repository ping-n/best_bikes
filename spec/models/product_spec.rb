require_relative "../../lib/class/Product"

describe 'Product' do
  before(:each) do
    @product = Product.new(123, "Test Product", 2000)
  end

  # Should have valid Attributes
  it 'should be valid with a uuid' do
    expect(@product.uuid).to eq 123
  end

  it 'should be valid with a name' do
    expect(@product.name).to eq 'Test Product'
  end

  it 'should be valid with a price' do
    expect(@product.price).to eq 2000
  end

  # Updating Attributes
  it 'should be able to change product name' do
    @product.update_name('New Name')
    expect(@product.name).to eq 'New Name'
  end

  it 'should be able to change product price' do
    @product.update_price(3000)
    expect(@product.price).to eq 3000
  end
end
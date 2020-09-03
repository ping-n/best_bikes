require_relative '../../lib/models/cart'
require 'spec_helper'

RSpec.describe Cart do
  let(:cart) { Cart.new }
  let(:product) { Product.new(123, 'Test Product', 15) }
  let(:expensive) { Product.new(233, 'Expensive Product', 51) }

  it 'should an instance of Cart' do
    expect(cart.class).to eq(Cart)
  end

  # subtotal
  it 'should start at 0 subtotal' do
    expect(cart.subtotal).to eq 0
  end

  describe 'should be able to sum price of shopping cart' do
    context 'with one item in shopping cart' do
      it 'should be able to calculate subtotal' do
        cart.add_to_cart(product)
        expect(cart.subtotal).to eq 15
      end
    end

    context 'with 2 items in shopping cart' do
      it 'should be able to calculate subtotal' do
        2.times { cart.add_to_cart(product) }
        expect(cart.subtotal).to eq 30
      end
    end
  end

  # total
  it 'should start at 0 total' do
    expect(cart.total).to eq 0
  end

  describe 'should be able to apply discounts' do
    context 'with subtotal under $20' do
      it 'should apply no discount on purchases under $20' do
        cart.add_to_cart(product)
        cart.subtotal
        cart.discount
        expect(cart.total).to eq 15
      end
    end

    context 'with subtotal over $20' do
      it 'should apply 10% discount on purchases over $20 and under $50' do
        2.times { cart.add_to_cart(product) }
        cart.subtotal
        cart.discount
        expect(cart.total).to eq 27
      end
    end

    context 'with subtotal over $50' do
      it 'should apply 15% discount on purchases over $50 and under $100' do
        cart.add_to_cart(expensive)
        cart.subtotal
        cart.discount
        expect(cart.total).to eq 43.35
      end
    end

    context 'with 2 items in shopping cart' do
      it 'should apply 20% discount on purchases over $100' do
        2.times { cart.add_to_cart(expensive) }
        cart.subtotal
        cart.discount
        expect(cart.total).to eq 81.6
      end
    end
  end

  # shopping cart
  describe 'shopping cart' do
    context 'with no items' do
      it 'shopping cart should be empty' do
        expect(cart.shopping_cart).to eq []
      end
    end

    context 'with one item' do
      it 'shopping cart should contain one item' do
        cart.add_to_cart(product)
        expect(cart.shopping_cart).to include product
      end
    end

    context 'with more than one item' do
      it 'shopping cart should contain one item' do
        2.times { cart.add_to_cart(product) }
        expect(cart.shopping_cart.length).to eq 2
      end
    end
  end
end

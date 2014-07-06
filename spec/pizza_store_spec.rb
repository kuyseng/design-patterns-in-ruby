require 'spec_helper'
require_relative '../lib/pizza_store.rb'

describe PizzaStore do
  let(:factory) { SimplePizzaFactory.new }
  let(:store)   { PizzaStore.new(factory) }

  it 'order cheese pizza' do
    expect(store.order_pizza('cheese').class).to eq CheesePizza
  end

  it 'order clam pizza' do
    expect(store.order_pizza('clam').class).to eq ClamPizza
  end

  it 'order veggie pizza' do
    expect(store.order_pizza('veggie').class).to eq VeggiePizza
  end

  it 'raise error for unknown pizza' do
    expect{ store.order_pizza('no_found').class }.to raise_error
  end
end

require 'spec_helper'
require_relative '../lib/pizza_store.rb'

describe PizzaStore do

  it 'order cheese pizza' do
    expect(subject.order_pizza('cheese').class).to eq CheesePizza
  end

  it 'order clam pizza' do
    expect(subject.order_pizza('clam').class).to eq ClamPizza
  end

  it 'order veggie pizza' do
    expect(subject.order_pizza('veggie').class).to eq VeggiePizza
  end

  it 'raise error for unknown pizza' do
    expect{ subject.order_pizza('no_found').class }.to raise_error
  end
end

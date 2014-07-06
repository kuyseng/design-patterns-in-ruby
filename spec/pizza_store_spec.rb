require 'spec_helper'
require_relative '../lib/pizza_store.rb'

describe NYPizzaStore do
  it 'order cheese pizza' do
    expect(subject.order_pizza('cheese').class).to eq NYStyleCheesePizza
  end

  it 'order clam pizza' do
    expect(subject.order_pizza('clam').class).to eq NYStyleClamPizza
  end

  it 'order veggie pizza' do
    expect(subject.order_pizza('veggie').class).to eq NYStyleVeggiePizza
  end

  it 'raise error for unknown pizza' do
    expect{ subject.order_pizza('no_found').class }.to raise_error
  end
end

describe ChicagoPizzaStore do
  it 'order cheese pizza' do
    expect(subject.order_pizza('cheese').class).to eq ChicagoStyleCheesePizza
  end

  it 'order clam pizza' do
    expect(subject.order_pizza('clam').class).to eq ChicagoStyleClamPizza
  end

  it 'order veggie pizza' do
    expect(subject.order_pizza('veggie').class).to eq ChicagoStyleVeggiePizza
  end

  it 'raise error for unknown pizza' do
    expect{ subject.order_pizza('no_found').class }.to raise_error
  end
end

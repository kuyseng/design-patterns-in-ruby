require 'spec_helper'
require_relative '../lib/pizza_store.rb'

describe NYPizzaStore do
  it 'order cheese pizza' do
    cheese = subject.order_pizza('cheese')
    expect(cheese.class).to eq CheesePizza
    # ingredients
    expect(cheese.dough.class).to eq ThinCrustDough
    expect(cheese.sauce.class).to eq MarinaraSauce
    expect(cheese.cheese.class).to eq ReggianoCheese
  end

  it 'order clam pizza' do
    clam_pizza  = subject.order_pizza('clam')
    expect(clam_pizza.class).to eq ClamPizza
    # ingredients
    expect(clam_pizza.dough.class).to eq ThinCrustDough
    expect(clam_pizza.sauce.class).to eq MarinaraSauce
    expect(clam_pizza.cheese.class).to eq ReggianoCheese
    expect(clam_pizza.clam.class).to eq FreshClams
  end
end

describe ChicagoPizzaStore do
    it 'order cheese pizza' do
    cheese = subject.order_pizza('cheese')
    expect(cheese.class).to eq CheesePizza
    # ingredients
    expect(cheese.dough.class).to eq ThickCrustDough
    expect(cheese.sauce.class).to eq PlumTomatoSauce
    expect(cheese.cheese.class).to eq MozzarellaCheese
  end

  it 'order clam pizza' do
    clam_pizza  = subject.order_pizza('clam')
    expect(clam_pizza.class).to eq ClamPizza
    # ingredients
    expect(clam_pizza.dough.class).to eq ThickCrustDough
    expect(clam_pizza.sauce.class).to eq PlumTomatoSauce
    expect(clam_pizza.cheese.class).to eq MozzarellaCheese
    expect(clam_pizza.clam.class).to eq FrozenClams
  end
end

class PizzaStore
  attr_accessor :ingredient_factory

  def order_pizza(pizza_type)
    pizza = create_pizza(pizza_type)
    pizza.prepare
    pizza.bake
    pizza.cut
    pizza.box
    pizza
  end

  def create_pizza(pizza_type)
    raise "need to implement"
  end
end

class NYPizzaStore < PizzaStore
  def initialize
    @ingredient_factory = NYPizzaIngredientFactory.new
  end

  def create_pizza(pizza_type)
    # CheesePizza.new(ingredient_factory)
    self.class.const_get("#{pizza_type.capitalize}Pizza").new(ingredient_factory)
  end
end

class ChicagoPizzaStore < PizzaStore
  def initialize
    @ingredient_factory = ChicagoPizzaIngredientFactory.new
  end
  
  def create_pizza(pizza_type)
    # ClamPizza.new(ingredient_factory)
    self.class.const_get("#{pizza_type.capitalize}Pizza").new(ingredient_factory)
  end
end

class PizzaIngredientFactory
  def create_dough; raise_to_implement  end
  def create_sauce; raise_to_implement  end
  def create_cheese; raise_to_implement end
  def create_veggies; raise_to_implement end
  def create_peperoni; raise_to_implement end
  def create_clam; raise_to_implement end

  private
  def raise_to_implement
    raise "need to implement"
  end
end

class NYPizzaIngredientFactory < PizzaIngredientFactory
  def create_dough;  ThinCrustDough.new end
  def create_sauce;  MarinaraSauce.new  end
  def create_cheese; ReggianoCheese.new end
  def create_veggies
    [ Garlic.new, Mushroom.new ]
  end
  def create_pepperoni; SlicedPepperoni.new end
  def create_clam; FreshClams.new end
end

class ChicagoPizzaIngredientFactory < PizzaIngredientFactory 
  def create_dough; ThickCrustDough.new end
  def create_sauce; PlumTomatoSauce.new end
  def create_cheese; MozzarellaCheese.new end
  def create_veggies
    [ BlackOlives.new, Eggplant.new ]
  end
  def create_pepperoni; SlicedPepperoni.new end
  def create_clam; FrozenClams.new end
end

class Pizza
  attr_accessor :ingredient_factory, :name, :dough,
                :sauce, :cheese, :veggie, :pepperoni, :clam

  def initialize(ingredient_factory)
    @ingredient_factory = ingredient_factory;
  end
  def prepare
    raise "need to implement"
  end
  def bake
    puts "Bake for 25 minutes at 350"
  end
  def cut
    puts "Cutting the pizza into diagonal slices"
  end
  def box
    puts "Place pizza in official PizzaStore box"
  end
end

class CheesePizza < Pizza 
  def prepare
    puts "Preparing #{name}"
    @dough  = ingredient_factory.create_dough
    @sauce  = ingredient_factory.create_sauce
    @cheese = ingredient_factory.create_cheese
  end
end

class ClamPizza < Pizza 

  def prepare
    puts "Preparing #{name}"
    @dough = ingredient_factory.create_dough
    @sauce = ingredient_factory.create_sauce
    @cheese = ingredient_factory.create_cheese
    @clam = ingredient_factory.create_clam
  end
end

# ingredients
# NY
class ThinCrustDough; end
class MarinaraSauce; end
class ReggianoCheese; end
class Garlic; end
class SlicedPepperoni; end
class FreshClams; end
# Chicago
class ThickCrustDough; end
class PlumTomatoSauce; end
class MozzarellaCheese; end
class BlackOlives; end
class Eggplant; end
class FrozenClams; end
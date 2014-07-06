class PizzaStore
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
  def create_pizza(pizza_type)
    self.class.const_get("NYStyle#{pizza_type.capitalize}Pizza").new
  end
end

class ChicagoPizzaStore < PizzaStore
  def create_pizza(pizza_type)
    self.class.const_get("ChicagoStyle#{pizza_type.capitalize}Pizza").new
  end
end

class Pizza
  def prepare
    raise "need to implement"
  end
  def bake
    "bake.."
  end
  def cut
    "cutt.."
  end
  def box
    "put in box.."
  end
end

class NYStyleCheesePizza < Pizza
  def prepare
    "prepare for cheese pizza of NY style"
  end
end

class NYStyleClamPizza < Pizza
  def prepare
    "prepare for clam pizza of NY style"
  end
end

class NYStyleVeggiePizza < Pizza
  def prepare
    "prepare for veggie pizza of Chicago style"
  end
end

class ChicagoStyleCheesePizza < Pizza
  def prepare
    "prepare for cheese pizza of Chicago style"
  end
end

class ChicagoStyleClamPizza < Pizza
  def prepare
    "prepare for clam pizza of Chicago style"
  end
end

class ChicagoStyleVeggiePizza < Pizza
  def prepare
    "prepare for veggie pizza of Chicago style"
  end
end

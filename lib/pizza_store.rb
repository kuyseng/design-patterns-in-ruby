class PizzaStore
  def order_pizza(pizza_type)
    pizza = case pizza_type.downcase
            when "cheese"
              CheesePizza.new
            when "clam"
              ClamPizza.new
            when "veggie"
              VeggiePizza.new
            else
              raise "Unknown"
            end
    pizza.prepare
    pizza.bake
    pizza.cut
    pizza.box
    pizza
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

class CheesePizza < Pizza
  def prepare
    "prepare for cheese pizza"
  end
end

class ClamPizza < Pizza
  def prepare
    "prepare for clam pizza"
  end
end

class VeggiePizza < Pizza
  def prepare
    "prepare for veggie pizza"
  end
end

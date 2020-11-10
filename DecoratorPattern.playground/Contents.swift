import UIKit

class Order {
    func show() {
        print("Water")
    }
}

class Item: Order {
    private(set) var order: Order?
    
    func decorate(order: Order) {
        self.order = order
    }
    
    override func show() {
        if let order = order {
            order.show()
        }
    }
}

class Drink: Item {
    private func addDrink() {
        print("Drink")
    }
    
    override func show() {
        super.show()
        addDrink()
    }
}

class MainMeal: Item {
    private func addMainMeal() {
        print("Main Meal")
    }
    
    override func show() {
        super.show()
        addMainMeal()
    }
}

class Salad: Item {
    private func addSalad() {
        print("Salad")
    }
    
    override func show() {
        super.show()
        addSalad()
    }
}

class Soup: Item {
    private func addSoup() {
        print("Soup")
    }
    
    override func show() {
        super.show()
        addSoup()
    }
}


let order = Order()
let drink = Drink()
let salad = Salad()
let soup = Soup()

drink.decorate(order: order)
salad.decorate(order: drink)
soup.decorate(order: salad)
soup.show()

print(drink.order === order)
print(salad.order === drink)
print(soup.order === salad)

print(soup.order === order)

class SimpleSet: Item {

    private func addSet() {
        let order = Order()
        let salad = Salad()
        let mainMeal = MainMeal()
        let drink = Drink()
        salad.decorate(order: order)
        mainMeal.decorate(order: salad)
        drink.decorate(order: mainMeal)
        decorate(order: drink)
    }

    override func show() {
        addSet()
        super.show()
    }

}

let simpleSet = SimpleSet()
simpleSet.show()


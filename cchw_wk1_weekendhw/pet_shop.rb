# Mike Thorpe 29-06-2018
# Pet Shop project

# return pet shop name
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end


def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end


def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
end


def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end


def increase_pets_sold(pet_shop, new_pet_sales)
  pet_shop[:admin][:pets_sold] += new_pet_sales
end


def stock_count(pet_shop)
  return pet_shop[:pets].length
end


def pets_by_breed(pet_shop, matching_breed)

  pets = pet_shop[:pets]
  pets_same_breed = []

  for pet in pets
      pets_same_breed.push(pet) if (pet[:breed] == matching_breed)
  end

  return pets_same_breed

end


def find_pet_by_name(pet_shop, pet_name)

  pets = pet_shop[:pets]

  for pet in pets
    return pet if (pet[:name] == pet_name)
  end

  return nil

end


def remove_pet_by_name(pet_shop, pet_name)

  pets = pet_shop[:pets]

  for pet in pets
    pets.delete(pet) if (pet[:name] == pet_name)
  end

end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end


def customer_cash(customer)
  return customer[:cash]
end


def remove_customer_cash(customer, cash)
  customer[:cash] -= cash
end


def customer_pet_count(customer)
  return customer[:pets].length
end


def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end


def customer_can_afford_pet(customer, new_pet)

  remaining_customer_cash = customer_cash(customer) - new_pet[:price]
  return false if (remaining_customer_cash < 0)
  return true

end


def sell_pet_to_customer(pet_shop, pet, customer)

  if (pet_shop[:pets].find_index(pet)!=nil)

    customer_can_afford = customer_can_afford_pet(customer, pet)

    if (customer_can_afford)

      add_pet_to_customer(customer, pet)
      increase_pets_sold(pet_shop, 1)
      remove_customer_cash(customer, pet[:price])
      add_or_remove_cash(pet_shop, pet[:price])

    end

  end

end

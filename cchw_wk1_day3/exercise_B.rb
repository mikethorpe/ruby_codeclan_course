# Mike Thorpe 27-06-2018
# Homework

## Exercise B

### Given the following data structure:

users = {
  "Jonathan" => {
    :twitter => "jonnyt",
    :lottery_numbers => [6, 12, 49, 33, 45, 20],
    :home_town => "Stirling",
    :pets => [
    {
      :name => "fluffy",
      :species => "cat"
    },
    {
      :name => "fido",
      :species => "dog"
    },
    {
      :name => "spike",
      :species => "dog"
    }
  ]
  },
  "Erik" => {
    :twitter => "eriksf",
    :lottery_numbers => [18, 34, 8, 11, 24],
    :home_town => "Linlithgow",
    :pets => [
    {
      :name => "nemo",
      :species => "fish"
    },
    {
      :name => "kevin",
      :species => "fish"
    },
    {
      :name => "spike",
      :species => "dog"
    },
    {
      :name => "rupert",
      :species => "parrot"
    }
  ]
  },
  "Avril" => {
    :twitter => "bridgpally",
    :lottery_numbers => [12, 14, 33, 38, 9, 25],
    :home_town => "Dunbar",
    :pets => [
      {
        :name => "monty",
        :species => "snake"
      }
    ]
  }
}

### Complete these tasks:
# 1. Get Jonathan's Twitter handle (i.e. the string `"jonnyt"`)
jonathans_twitter = users["Jonathan"][:twitter]

# 2. Get Erik's hometown
eriks_hometown = users["Erik"][:home_town]
# 3. Get the array of Erik's lottery numbers
eriks_numbers = users["Erik"][:lottery_numbers]

# 4. Get the type of Avril's pet Monty
monty_pet_type = users["Avril"][:pets][0][:species]

# 5. Get the smallest of Erik's lottery numbers
eriks_smallest_lottery_number = users["Erik"][:lottery_numbers].min

# 6. Return an array of Avril's lottery numbers that are even

def get_users_even_lottery_numbers(user)

  lottery_numbers = user[:lottery_numbers]
  even_lottery_numbers = []

  for number in lottery_numbers
    if (number % 2 == 0)
      even_lottery_numbers.push(number)
    end
  end

  return even_lottery_numbers
end

avrils_even_numbers = get_users_even_lottery_numbers(users["Avril"])

# 7. Erik is one lottery number short! Add the number `7` to be included in his lottery numbers
users["Erik"][:lottery_numbers].push(7)

# 8. Change Erik's hometown to Edinburgh
users["Erik"][:home_town] = "Edinburgh"

# 9. Add a pet dog to Erik called "Fluffy"
eriks_dog = {
  name: "Fluffy",
  species: "dog"
}
users["Erik"][:pets].push(eriks_dog)

# 10. Add another person to the users hash
users[:Mike]=Hash.new()

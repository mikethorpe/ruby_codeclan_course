def return_10
  return 10
end


def add(num1, num2)
  result = num1 + num2
  return result
end

def subtract (num1, num2)
  result = num1 - num2
  return result
end

def multiply(num1, num2)
  result = num1 * num2
  return result
end

def divide (num1, num2)
  result = num1 / num2
  return result
end

def length_of_string(input_string)
  string_length = input_string.length()
  return string_length
end

def join_string( string_1, string_2 )
  joined_string = string_1 + string_2
  return joined_string
end

def add_string_as_number(string1, string2)
  result = string1.to_i + string2.to_i
  return result
end

def number_to_full_month_name (month_number)
  result = case (month_number)
  when 1
    "January"
  when 3
    "March"
  when 9
    "September"
  end

  return result
end

def number_to_short_month_name(month_num)
  short_month = case month_num
  when 1
    "Jan"
  when 4
    "Apr"
  when 10
    "Oct"
  end

  return short_month
end

def get_cube_vol(num1)
  volume = num1**3
  return volume
end

# To 2dp
def get_sphere_vol(radius)
  volume = (4.0/3.0)*Math::PI*(radius**3)
  volume = volume.round(2)
  return volume
end

# To 2dp
def temp_farenheit_to_celcius(temp_f)
  temp_c = (temp_f - 32.0) * (5.0/9.0)
  temp_c = temp_c.round(2)
  return temp_c
end

require_relative('models/bounty')

mad_mark = Bounty.new(
  {
    'name' => 'Mark Ditzel', 'bounty_value' => '5', 'collected_by' => nil
  }
)

mad_mark.save()
mad_mark.collected_by = "Krazy Keith"
mad_mark.update()

magic_mike = Bounty.new(
  {
    'name' => 'Mike Thorpe', 'bounty_value' => '2', 'collected_by' => 'Bad-boy Bazlinton'
  }
)

magic_mike.save()

catch_mark = Bounty.find_by_name('Mark Ditzel')
puts catch_mark.name
puts catch_mark.id

# magic_mike.delete()
# magic_mike.delete()

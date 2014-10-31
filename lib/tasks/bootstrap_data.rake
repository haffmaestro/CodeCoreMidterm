task bootstrap_data: [:environment] do

  20.times {
    Idea.create(
      title: Faker::Hacker.say_something_smart,
      description: Faker::Lorem.paragraph(6),
      user: User.all.sample
      )
  }

  Idea.all.each do |idea|
    
    idea.comments.create(
      body: Faker::Hacker.say_something_smart,
      user: User.all.sample
      )
  end

end
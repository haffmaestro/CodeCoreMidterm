task bootstrap_comments: [:environment] do
  Idea.all.each do |idea|
   rand(10).times {
    idea.comments.create(
      body: Faker::Hacker.say_something_smart,
      user: User.all.sample
      )
    }
  end

end
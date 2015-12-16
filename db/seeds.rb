# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_or_create_by(email: 'user@test.com') do |u|
  u.password = 'password'
  u.password_confirmation = 'password'
end

sport_category = Category.find_or_create_by(title: 'Sport')
pets_category = Category.find_or_create_by(title: 'Pets')

[
  {
    title: 'About my cat',
    content: 'My cat is so fat, that he literally cannot walk.',
    user_id: user.id,
    category_id: pets_category.id
  },
  {
    title: 'Why sport is important',
    content: 'Playing sports helps you stay in shape, teaches you how to organize your time.',
    user_id: user.id,
    category_id: sport_category.id
  }
].each do |params|
  Story.find_or_create_by(title: params[:title]) do |story|
    story.assign_attributes(params)
  end
end

another_user = User.find_or_create_by(email: 'anotheruser@test.com') do |u|
  u.password = 'password'
  u.password_confirmation = 'password'
end

[
  {
    title: 'Dog for kids',
    content: 'Kids with dogs fared better than those with cats: Overall, babies who lived with a dog were 31% more likely to be healthy',
    user_id: another_user.id,
    category_id: pets_category.id
  },
  {
    title: 'Football tricks',
    content: 'While playing football, use your legs to beat the ball.',
    user_id: another_user.id,
    category_id: sport_category.id
  }
].each do |params|
  Story.find_or_create_by(title: params[:title]) do |story|
    story.assign_attributes(params)
  end
end

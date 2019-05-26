p 'Creating Test User'
test_user = User.create!(
  first_name: 'Test',
  last_name: 'User',
  email: 'user@test.com',
  password: 'password',
  password_confirmation: 'password'
)

p 'Creating sample users'
99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "user-#{n + 1}@test.com"
  password = 'password'
  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password,
    password_confirmation: password
  )
end

p 'Creating Test Company'
test_company = Company.create!(
  name: 'Test Company',
  description: 'Test Company with reviews by Test User.',
  website: 'company.test.com'
)

p 'Creating sample companies'
99.times do |n|
  name = Faker::Company.name
  description = "#{Faker::Company.catch_phrase}, #{Faker::Company.bs}."
  website = "company-#{n + 1}.test.com"
  Company.create!(
    name: name,
    description: description,
    website: website
  )
end

p 'Creating review of Test Company by Test User'
Review.create!(
  user_id: test_user.id,
  company_id: test_company.id,
  description: 'A review of Test Company by Test User.',
  rating: 2.1,
  job_title: 'Review Tester',
  term: '2B',
  year: '2021',
  salary: '20-30',
  location: 'Test City'
)

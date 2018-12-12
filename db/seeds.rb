puts "Cleaning up database..."

UserInterest.destroy_all
UserCity.destroy_all


City.destroy_all

Country.destroy_all

User.destroy_all

Interest.destroy_all

puts "--------------------------------------------"

puts "----------------Seeding Countries and Cities--------------------"

Country.create!(name: "Portugal")
Country.create!(name: "USA")
Country.create!(name: "Canada");
Country.create!(name: "UK")
Country.create!(name: "Ireland")

City.create!(country: Country.find_by(name:"Portugal"), name:"Lisboa")
City.create!(country: Country.find_by(name:"Portugal"), name:"Porto")
City.create!(country: Country.find_by(name:"Portugal"), name:"Coimbra")

City.create!(country: Country.find_by(name:"USA"), name:"New York")
City.create!(country: Country.find_by(name:"USA"), name:"Chicago")
City.create!(country: Country.find_by(name:"USA"), name:"Dallas")

City.create!(country: Country.find_by(name:"UK"), name:"Yorkshire")
City.create!(country: Country.find_by(name:"UK"), name:"London")
City.create!(country: Country.find_by(name:"UK"), name:"Liverpool")

City.create!(country: Country.find_by(name:"Ireland"), name:"Dublin")
City.create!(country: Country.find_by(name:"Ireland"), name:"Cork")
City.create!(country: Country.find_by(name:"Ireland"), name:"Sligo")

City.create!(country: Country.find_by(name:"Canada"), name:"Toronto")
City.create!(country: Country.find_by(name:"Canada"), name:"Vancouver")
City.create!(country: Country.find_by(name:"Canada"), name:"Ottawa")

puts "Created #{Country.count} and #{City.count}"

puts "----------------Seeding Interests--------------------"
interests = Interest.create!([{ name: "Entertainment" }, { name: "Fitness" },
  { name: "Humor" }, { name: "Video Games" }, { name: "Books" }, { name: "Politics" },
  { name: "Sports" }, { name: "Travel" }, { name: "Games & Puzzles" }])

puts "Created #{Interest.count} New interests"


puts "----------------Seeding Users--------------------"

users = [{
  first_name: "Bradly",
  email: "bigB@flavour.com",
  password: "123456",
  age: 26,
  photo: "https://images.unsplash.com/photo-1532041197616-d08b289c0052?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80",
  gender: "Male"
},
{
  first_name: "Sharron",
  email: "sexySharron@flavour.com",
  password: "789123",
  age: 30,
  photo: "https://images.unsplash.com/photo-1513732822839-24f03a92f633?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80",
  gender: "Female"
},
{
  first_name: "Larry",
  email: "lazyLarry@flavour.com",
  password: "456789",
  age: 50,
  photo: "https://images.unsplash.com/photo-1495078065017-564723e7e3e7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1300&q=80",
  gender: "Male"
},
{
  first_name: "Amy",
  email: "famy@flavour.com",
  password: "fatamy",
  age: 50,
  photo: "https://images.unsplash.com/photo-1495078065017-564723e7e3e7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1300&q=80",
  gender: "Female"
},
{
  first_name: "Larry",
  email: "lLarry@flavour.com",
  password: "456789",
  age: 50,
  photo: "https://iranhumanrights.org/wp-content/uploads/timthumb-3.jpeg",
  gender: "Male"
}]

users.each do |user|
  u = User.new(user)
  u.remote_photo_url = user[:photo]  if user.key?(:photo)
  u.save!
  UserCity.create!(user: u, city: City.find_by(name: "New York"))
end

users = [{
  first_name: "Paulo",
  email: "PauloN@flavour.com",
  password: "123456",
  age: 26,
  photo: "https://jooinn.com/images600_/young-man-2.jpg",
  gender: "Male"
},
{
  first_name: "Ana",
  email: "a_silva@flavour.com",
  password: "789123",
  age: 23,
  photo: "https://www.maxpixel.net/static/photo/2x/Femininity-Eyes-Beauty-Portrait-Face-Hair-Woman-1319951.jpg",
  gender: "Female"
},
{
  first_name: "João",
  email: "johnnyJ@flavour.com",
  password: "456789",
  age: 25,
  photo: "https://www.maxpixel.net/static/photo/2x/Summer-Vacation-Smile-Young-Man-3382131.jpg",
  gender: "Male"
},
{
  first_name: "Joana",
  email: "j_silva@flavour.com",
  password: "joanas",
  age: 33,
  photo: "https://www.maxpixel.net/static/photo/2x/Country-Acoustic-Guitar-Guitar-Girl-Talent-Woman-944261.jpg",
  gender: "Female"
},
{
  first_name: "Bruno",
  email: "bruno_rib@flavour.com",
  password: "ribeiro",
  age: 34,
  photo: "https://cdn.pixabay.com/photo/2016/04/12/01/59/young-man-1323605_1280.jpg",
  gender: "Male"
},
{
  first_name: "Susana",
  email: "SuFernandes@flavour.com",
  password: "susana",
  age: 33,
  photo: "https://www.maxpixel.net/static/photo/2x/Female-Woman-Beautiful-Da-Young-Girl-Smiling-1274056.jpg",
  gender: "Female"
},{
  first_name: "Paulo",
  email: "pneves@flavour.com",
  password: "123456",
  age: 26,
  photo: "https://jooinn.com/images600_/young-man-2.jpg",
  gender: "Male"
}]


users.each do |user|
  u = User.new(user)
  u.remote_photo_url = user[:photo]  if user.key?(:photo)
  u.save!
  UserCity.create!(user: u, city: City.find_by(name: "Lisboa"))
end

puts "Created #{User.count} New Users and #{UserCity.count}"

puts "----------------Seeding User_Interests--------------------"

User.all.each do |u|
  Interest.all.each { |i| UserInterest.create!(user: u, interest: i) }
end

puts "Created #{UserInterest.count} New User interests"

puts "----------------Seeding User_Interests--------------------"


puts "Created #{UserInterest.count} New Users"


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "rest-client"
require 'open-uri'

puts "Deleting all old celebz and users"
Celebrity.destroy_all
User.destroy_all
Booking.destroy_all


# User 1
user1 = User.create!(
  first_name: "Caio",
  last_name: "Coolcat",
  email: "caio@gmail.com",
  password: "123456",
  age: 32
)

morgan = Celebrity.new(
  name: "Morgan Freeman",
  category: "film",
  daily_rate: 140,
  description: "He is an American actor, director, and narrator. He is known for his distinctive deep voice and various roles in a wide variety of film genres."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129266/celebrities/Morgam_tuvbio.jpg")
morgan.photos.attach(io: file, filename: "Morgam_tuvbio.jpg", content_type: "image/jpg")
morgan.user = user1
morgan.save!

james = Celebrity.new(
  name: "James Hetfield",
  category: "music",
  daily_rate: 140,
  description: "He is an American musician. He is the lead vocalist, rhythm guitarist, co-founder and a main songwriter of heavy metal band Metallica"
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129265/celebrities/James_srthsm.jpg")
james.photos.attach(io: file, filename: "James_srthsm.jpg", content_type: "image/jpg")
james.user = user1
james.save!

gisele = Celebrity.new(
  name: "Gisele Bundchen",
  category: "influencer",
  daily_rate: 90,
  description: "She was listed as the 89th-most-powerful woman in the World by Forbes. Recently single!"
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129265/celebrities/Gisele_vwdj1x.jpg")
gisele.photos.attach(io: file, filename: "Gisele_vwdj1x.jpg", content_type: "image/jpg")
gisele.user = user1
gisele.save!

gabriel = Celebrity.new(
  name: "Gabriel Medina",
  category: "sports",
  daily_rate: 200,
  description: "Brazilian professional surfer who won the 2014, 2018 and 2021
  WSL World Championships."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129265/celebrities/MEdina_yulnbj.jpg")
gabriel.photos.attach(io: file, filename: "MEdina_yulnbj.jpg", content_type: "image/jpg")
gabriel.user = user1
gabriel.save!

arnold = Celebrity.new(
  name: "Arnold Swarzenegger",
  category: "politics",
  daily_rate: 300,
  description: "Got ya didn't we? You'd think he would be in film or sports or influencer, but Arnie's other and arguably most important job has been serving the American people!"
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129264/celebrities/Arnold_tyfvc8.jpg")
arnold.photos.attach(io: file, filename: "Arnold_tyfvc8.jpg", content_type: "image/jpg")
arnold.user = user1
arnold.save!

# User 2
user2 = User.create!(
  first_name: "Deanna",
  last_name: "Kamiyama",
  email: "deanna@gmail.com",
  password: "123456",
  age: 31
)

brad = Celebrity.new(
  name: "Brad Pitt",
  category: "film",
  daily_rate: 150,
  description: "Brad Pitt, one of the most recognizable and universally beloved movie stars on the A-list, is often described as a character actor in a leading man’s body. And that body has won Sexiest Man Alive twice. That’s all."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129264/celebrities/bradpitt_older_jx0qfr.jpg")
brad.photos.attach(io: file, filename: "bradpitt_older_jx0qfr", content_type: "image/jpg")
brad.user = user2
brad.save!

cal = Celebrity.new(
  name: "Cal Ripken Jr.",
  category: "sports",
  daily_rate: 88,
  description: "Nicknamed 'The Iron Man', he mis an American former baseball shortstop and third baseman who played 21 seasons in Major League Baseball for the Baltimore Orioles only. He is all about loyalty and playing the long-game."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129265/celebrities/calripken_uniform_xaywzw.jpg")
cal.photos.attach(io: file, filename: "calripken_uniform_xaywzw.jpg", content_type: "image/jpg")
cal.user = user2
cal.save!

taylor = Celebrity.new(
  name: "Taylor Swift",
  category: "music",
  daily_rate: 1989,
  description: "Taylor Swift is a singer-songwriter who has won 11 Grammys (so far). She is the first and only woman solo artist to win the Grammy for Album Of The Year three times, and her dating history is just as illustrious and star-studded. Care to fill in one of her blank spaces?"
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129266/celebrities/taylorswift_folklore_pcnx7l.jpg")
taylor.photos.attach(io: file, filename: "taylorswift_folklore_pcnx7l.jpg", content_type: "image/jpg")
taylor.user = user2
taylor.save!

kendall = Celebrity.new(
  name: "Kendall Jenner",
  category: "influencer",
  daily_rate: 75,
  description: "Influencer	Kendall Jenner is a fashion model and reality star, having grown up on her family's 'Keeping Up With The Kardashians' show. In comparison to her other famous siblings, it doesn't look as if she's had as much plastic surgery."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129265/celebrities/Kendalljenner_formal_v6tclv.jpg")
kendall.photos.attach(io: file, filename: "Kendalljenner_formal_v6tclv.jpg", content_type: "image/jpg")
kendall.user = user2
kendall.save!

bernie = Celebrity.new(
  name: "Bernie Sanders",
  category: "politics",
  daily_rate: 75,
  description: "Bernie is the longest-serving senator in Congressional history as an Independent, and has run two near-successful presidential campaigns. He doesn't care about her emails, keeps a close relationship with tiny birds, and has impeccable taste in condescending-looking mittens."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129264/celebrities/berniesanders_mittens_fn9055.jpg")
bernie.photos.attach(io: file, filename: "berniesanders_mittens_fn9055.jpg", content_type: "image/jpg")
bernie.user = user2
bernie.save!

# User 3
user3 = User.create!(
  first_name: "Lucy",
  last_name: "Treganna",
  email: "lucy@gmail.com",
  password: "123456",
  age: 30
)

leo = Celebrity.new(
  name: "Leonardo DiCaprio",
  category: "film",
  daily_rate: 125,
  description: "Leonardo DiCaprio is an award-winning American actor and film producer. If you are a model under the age of 25, Leo would love to meet you!"
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129266/celebrities/Leonardo_Dicaprio_hr1dwp.jpg")
leo.photos.attach(io: file, filename: "Leonardo_Dicaprio_hr1dwp.jpg", content_type: "image/jpg")
leo.user = user3
leo.save!

snoop = Celebrity.new(
  name: "Snoop Dogg",
  category: "music",
  daily_rate: 100,
  description: "Calvin Cordozar Broadus Jr., known professionally as Snoop Dogg (previously Snoop Doggy Dogg and briefly Snoop Lion), is an American rapper. Rent him out and you will fo shizzle have a good time."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129266/celebrities/Snoop_Dogg_rcj31t.jpg")
snoop.photos.attach(io: file, filename: "Snoop_Dogg_rcj31t.jpg", content_type: "image/jpg")
snoop.user = user3
snoop.save!

paris = Celebrity.new(
  name: "Paris Hilton",
  category: "influencer",
  daily_rate: 150,
  description: "Paris Hilton is an American media personality, businesswoman, socialite, model, and entertainer. Born in New York City, and raised there and in Beverly Hills, California, she is a great-granddaughter of Conrad Hilton, the founder of Hilton Hotels."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129267/celebrities/Paris_Hilton_vzng45.jpg")
paris.photos.attach(io: file, filename: "Paris_Hilton_vzng45.jpg", content_type: "image/jpg")
paris.user = user3
paris.save!

mo = Celebrity.new(
  name: "Mo Farah",
  category: "sports",
  daily_rate: 90,
  description: "Sir Mohamed Muktar Jama Farah is a British long-distance runner. His 10 global championship gold medals (4 Olympic and 6 World titles) make him the most successful male track distance runner ever, and he is the most successful British track athlete in modern Olympic Games history."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129266/celebrities/Mo_Farah_jdjmcr.jpg")
mo.photos.attach(io: file, filename: "Mo_Farah_jdjmcr.jpg", content_type: "image/jpg")
mo.user = user3
mo.save!

charlie = Celebrity.new(
  name: "King Charles III",
  category: "politics",
  daily_rate: 500,
  description: "Charles III is unfortunaelty King of the United Kingdom and the 14 other Commonwealth realms. He was the longest-serving heir apparent and Prince of Wales and, at age 73, became the oldest person to accede to the British throne, finally upon the death of his mother, Elizabeth II, on 8 September 2022."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129267/celebrities/King-Charles_hosbiv.png")
charlie.photos.attach(io: file, filename: "King-Charles_hosbiv.png", content_type: "image/png")
charlie.user = user3
charlie.save!

# User 4
user4 = User.create!(
  first_name: "Brodie",
  last_name: "White",
  email: "brodie@gmail.com",
  password: "123456",
  age: 30
)

john = Celebrity.new(
  name: "John Lennon",
  category: "music",
  daily_rate: 200,
  description: "One of the founding members of pop Group 'The Beatles'. Despite him being shot and killed in 1980, he is available to rent here on our platform. You have the choice of either a hologram or a lifesize inflatable John."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129265/celebrities/lennon_xosgx2.jpg")
john.photos.attach(io: file, filename: "lennon_xosgx2.jpg", content_type: "image/jpg")
john.user = user4
john.save!

roger = Celebrity.new(
  name: "Roger Federer",
  category: "sports",
  daily_rate: 75,
  description: "Widely recognized as the GOAT. Roger Federer has won 20 grand slam titles and changed the way the game was played. Having recently retired, Roger has decided to rent himself out on our platform as now he has so much time on his hands."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129265/celebrities/fed_prof_zbzlwa.jpg")
roger.photos.attach(io: file, filename: "fed_prof_zbzlwa.jpg", content_type: "image/jpg")
roger.user = user4
roger.save!

jennifer = Celebrity.new(
  name: "Jennifer Coolidge",
  category: "film",
  daily_rate: 110,
  description: "Jennifer Coolidge is one whacky actress. Having recently won an Emmy and a Golden Globe for her performance on hit series 'The White Lotus', Jennifer is hot property!"
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129265/celebrities/coolidge_urbzaz.jpg")
jennifer.photos.attach(io: file, filename: "coolidge_urbzaz.jpg", content_type: "image/jpg")
jennifer.user = user4
jennifer.save!

zoe = Celebrity.new(
  name: "Zoe Sugg",
  category: "influencer",
  daily_rate: 175,
  description: "Apparently Zoe Sugg is a popular vlogger. Not a blogger or a videographer but something in between. She has lots of money already by the looks so maybe rent someone else."
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129266/celebrities/zoe_sugg_hxrcui.jpg")
zoe.photos.attach(io: file, filename: "zoe_sugg_hxrcui.jpg", content_type: "image/jpg")
zoe.user = user4
zoe.save!

beto = Celebrity.new(
  name: "Beto O'Rourke",
  category: "politics",
  daily_rate: 75,
  description: "Beto is an American politician who served as the U.S. representative for Texas's 16th congressional district from 2013 to 2019. He's rides a skateboard and is a rad dude. But you can find all that out for yourself here on our platform!"
)
file = URI.open("https://res.cloudinary.com/dui6ekrvn/image/upload/v1676129264/celebrities/beto_ic2lba.jpg")
beto.photos.attach(io: file, filename: "beto_ic2lba.jpg", content_type: "image/jpg")
beto.user = user4
beto.save!

# Finished!
puts "Done!"

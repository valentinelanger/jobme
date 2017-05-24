# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
Review.destroy_all
Request.destroy_all
Job.destroy_all
User.destroy_all

user = User.create!(
  email: 'arthur@norris.god',
  password: 'password',
  first_name: 'Arthur',
  last_name: 'Norris',
  sexe: 'man',
  photo: 'arthur.jpeg'
)

user1 = User.create!(
  email: 'guillaume@norris.god',
  password: 'password',
  first_name: 'Guillaume',
  last_name: 'Norris',
  sexe: 'man',
  photo: 'guillaumegr.jpeg'
)

user2 = User.create!(
  email: 'vanessa@norris.god',
  password: 'password',
  first_name: 'Vanessa',
  last_name: 'Norris',
  sexe: 'woman',
  photo: 'vanessalo.jpeg'
)

job = Job.create!(
  user: user,
  category: 'electrician',
  description: "je suis hyper fort et j'adore les cables electriques",
  city: 'Paris',
  title: "Moi c'est Arthur",
  price: 12
)

Review.create!(
  job_id: job.id,
  creator_id: user1.id,
  destinator_id: user.id,
  title: "Worst electrician ever!",
  content: "I don't have lights at my place anymore!",
  rating: 1,
  )

job = Job.create!(
  user: user,
  category: 'plumber',
  description: 'Meilleur plombier de la ville, satisfait ou remboursé!',
  city: 'Paris',
  title: 'La plomberie je connais!',
  price: 15
)


job = Job.create!(
  user: user1,
  category: 'gardener',
  description: "J'adore les jardins et serait ravi de m'occuper du vottre! Mais attention faut que ca soit bio",
  city: 'Paris',
  title: 'Vert et bio!',
  price: 25
)

Review.create!(
  job_id: job.id,
  creator_id: user.id,
  destinator_id: user1.id,
  title: "I call Guillaume all the time",
  content: "My garden is sooo bio now",
  rating: 4
  )

  Review.create!(
  job_id: job.id,
  creator_id: user2.id,
  destinator_id: user1.id,
  title: "He's aweful!!",
  content: "All my plants are dying because of him and his bio way of doing things",
  rating: 1
  )


job = Job.create!(
  user: user2,
  category: 'electrician',
  description: "Attention ca va péterrrrrrr",
  city: 'Paris',
  title: 'Make you interior light again',
  price: 30

)

Review.create!(
  job_id: job.id,
  creator_id: user1.id,
  destinator_id: user2.id,
  title: "Vanessa made my house great again",
  content: "Everything is brighter, I love it!",
  rating: 5
  )

user3 = User.create!(
  email: 'matthieu@norris.god',
  password: 'password',
  first_name: 'Matthieu',
  last_name: 'Norris',
  sexe: 'man',
  photo: 'matthieure.jpeg'
)

job = Job.create!(
  user: user3,
  category: 'baby-sitter',
  description: 'Vous pouvez me faire confiance, avec moi ils seront entre de bonnes mains',
  city: 'Paris',
  title: "J'adoooore les enfants",
  price: 15
)

Review.create!(
  job_id: job.id,
  creator_id: user.id,
  destinator_id: user3.id,
  title: "Never let this guy approach your children",
  content: "My children can't talk about anything but Auvergne and cheese!!",
  rating: 1
  )

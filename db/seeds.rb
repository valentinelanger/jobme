# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying all data..."
Message.destroy_all
Review.destroy_all
Request.destroy_all
Job.destroy_all
User.destroy_all

puts "creating all data..."

url_leo = "http://static1.puretrend.com/articles/5/14/98/15/@/1643505-si-leonardo-dicaprio-songe-a-fonder-une-950x0-8.jpg"
user_leo = User.new(
  email: 'leonardo@gmail.com',
  password: 'password',
  first_name: 'Leonardo',
  last_name: 'Di Caprio',
  sexe: 'man',
)
user_leo.save!
puts "Saving picture to cloudinary.... "
user_leo.picture_url = url_leo
puts "Picture saved"

url_gui = "https://images-na.ssl-images-amazon.com/images/M/MV5BODc4NDI1NzY5M15BMl5BanBnXkFtZTgwMTI1NTkyMTE@._V1_UX214_CR0,0,214,317_AL_.jpg"
user_gui = User.new(
  email: 'guillaume@norris.god',
  password: 'password',
  first_name: 'Guillaume',
  last_name: 'Norris',
  sexe: 'man'
)
user_gui.save!
puts "Saving picture to cloudinary.... "
user_gui.picture_url = url_gui
puts "Picture saved"

url_vane = "http://femme-maison.com/fm/wp-content/uploads/2016/05/Shooting-SS16-2015Q3-Image-4712-F39L-Interpol.jpg"
user_vane = User.new(
  email: 'vanessa@norris.god',
  password: 'password',
  first_name: 'Vanessa',
  last_name: 'Norris',
  sexe: 'woman'
)
user_vane.save!
puts "Saving picture to cloudinary.... "
user_vane.picture_url = url_vane
puts "Picture saved"

url_mat = "https://pbs.twimg.com/profile_images/704803842190405635/EVYfBn8h.jpg"
user_mat = User.new(
  email: 'matthieu@norris.god',
  password: 'password',
  first_name: 'Matthieu',
  last_name: 'Norris',
  sexe: 'man'
)
user_mat.save!
puts "Saving picture to cloudinary.... "
user_mat.picture_url = url_mat
puts "Picture saved"

puts "Users created ! Creating all jobs.... "

job_leo = Job.create!(
  user: user_leo,
  category: 'electrician',
  description: "10 ans d'expériences, employé EDF pendant 5 ans - Directeur de chantier - je suis hyper fort et j'adore les cables electriques",
  city: 'Paris',
  title: "Reconversion artisanale - Etre au plus proche des gens",
  price: 24
)

job_vane = Job.create!(
  user: user_vane,
  category: 'plumber',
  description: "15 ans d'experiences et BAC + 3, travail fin et spécialisation en canalisations. J'interviens principalement sur des urgences et travaille à côté dans une PME locale.",
  city: 'Lyon',
  title: 'Meilleur plombiere de la ville satisfait ou remboursé!',
  price: 15
)


job_gui = Job.create!(
  user: user_gui,
  category: 'gardener',
  description: "BAC + 5 - spécialisation potager biologique. Je travaille aujourd'hui en auto-entrepreneur depuis 5 ans. Jeune, dynamique, passionné de produits bio et je serais enchanté de vous accompagner dans votre transformation écologique! Disponibilité immédiate!",
  city: 'Paris',
  title: 'Optez pour le developpement durable!',
  price: 22
)

job_mat = Job.create!(
  user: user_mat,
  category: 'gardener',
  description: "BAC + 5 - spécialisation botaniste - parterre de fleurs. Je travaille en free-lance depuis 7 ans et je suis spécialisée dans l'élevage bio et le design de jardins. Expérimenté pour la création de parterres de fleurs. Auvergnat depuis toujours, je pratique ce métier afin d'être en contact permanent avec la nature et MA REGION !",
  city: 'Clermont-Ferrand',
  title: 'Fleurissez votre jardin',
  price: 28

)

job_mat2 = Job.create!(
  user: user_mat,
  category: 'baby-sitter',
  description: 'Vous pouvez me faire confiance, avec moi ils seront entre de bonnes mains',
  city: 'Paris',
  title: "Tact et douceur",
  price: 15
)

puts "Jobs created ! Creating all reviews.... "

Review.create!(
  job_id: job_gui.id,
  creator_id: user_vane.id,
  destinator_id: user_gui.id,
  title: "I call Guillaume all the time",
  content: "My garden is sooo bio now",
  rating: 4
)

Review.create!(
job_id: job_mat.id,
creator_id: user_leo.id,
destinator_id: user_mat.id,
title: "He's aweful!",
content: "All my plants are dying because of him and his bio way of doing things",
rating: 2
)

Review.create!(
  job_id: job_mat.id,
  creator_id: user_vane.id,
  destinator_id: user_mat.id,
  title: "Never let this guy approach your children",
  content: "My children can't talk about anything but Auvergne and cheese!!",
  rating: 1
)

Review.create!(
  job_id: job_leo.id,
  creator_id: user_vane.id,
  destinator_id: user_leo.id,
  title: "Worst electrician ever!",
  content: "I don't have lights at my place anymore!",
  rating: 1,
)


Review.create!(
  job_id: job_vane.id,
  creator_id: user_leo.id,
  destinator_id: user_vane.id,
  title: "Vanessa fixed everything with tact",
  content: "Everything is brighter, I love it!",
  rating: 5
  )


puts "Finished !"

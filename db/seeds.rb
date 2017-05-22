# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Job.destroy_all

user = User.create!(
  email: 'chuck@norris.god',
  password: 'password',
  first_name: 'Chuck',
  last_name: 'Norris',
  sexe: 'man',
  photo: 'image-exemple.jpg'
)

Job.create!(
  user: user,
  category: 'electrician',
  description: 'super fort!',
  city: 'Paris',
  title: 'salut'
)

Job.create!(
  user: user,
  category: 'plumber',
  description: 'au top!',
  city: 'Paris',
  title: 'salut'
)

user = User.create!(
  email: 'salut@norris.god',
  password: 'password',
  first_name: 'Salut',
  last_name: 'Norris',
  sexe: 'woman',
  photo: 'image-exemple.jpg'
)

Job.create!(
  user: user,
  category: 'gardener',
  description: 'trop fort',
  city: 'Lisbonne',
  title: 'salut'
)

user = User.create!(
  email: 'valentine@langer.god',
  password: 'password',
  first_name: 'Val',
  last_name: 'Langer',
  sexe: 'woman',
  photo: 'image-exemple.jpg'
)

Job.create!(
  user: user,
  category: 'baby-sitter',
  description: "j'adore les enfants",
  city: 'Lisbonne',
  title: 'salut'

)

user = User.create!(
  email: 'kevcha@norris.god',
  password: 'password',
  first_name: 'kevcha',
  last_name: 'Norris',
  sexe: 'man',
  photo: 'image-exemple.jpg'
)

Job.create!(
  user: user,
  category: 'interior-designer',
  description: 'loving style',
  city: 'London',
  title: 'salut'
)

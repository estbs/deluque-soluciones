# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Qualities
qualities = Quality.create(
  [
    { name: 'Carpintero', description: 'Trabaja con madera' },
    { name: 'Pintor', description: 'Trabaja con pintura' },
    { name: 'Plomero', description: 'Trabaja con tuberias' },
    { name: 'Aseo hogar', description: 'Limpieza de hogar' }
  ]
)

# Suppliers

# Services

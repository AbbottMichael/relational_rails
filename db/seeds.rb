# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Motorcycle.destroy_all
MotorcycleManufacturer.destroy_all
Game.destroy_all
GameStudio.destroy_all

zero = MotorcycleManufacturer.create!(
  name:                  'Zero',
  headquarters:          'Santa Cruz, California',
  usa_made:              true,
  total_models_all_time: 29
)
harley_davidson = MotorcycleManufacturer.create!(
  name:                  'Harley Davidson',
  headquarters:          'Milwaukee, Wisconsin',
  usa_made:              true,
  total_models_all_time: 1_615
)

zero.motorcycles.create!(
  model:    'SR/R',
  price:    19_995.0,
  electric: true
)
zero.motorcycles.create!(
  model:    'DSR',
  price:    15_495.0,
  electric: true
)

harley_davidson.motorcycles.create!(
  model: 'Fat Bob',
  price: 18_799.0,
  electric: false
)

harley_davidson.motorcycles.create!(
  model: 'Livewire',
  price: 29_799.0,
  electric: true
)

nintendo = GameStudio.create!(
  studio_name: 'Nintendo',
  employee_count: 6_547,
  hiring: true
)

sony = GameStudio.create!(
  studio_name: 'Sony',
  employee_count: 5_000,
  hiring: false
)

nintendo.games.create!(
  game_name: 'Super Mario World',
  game_cost: 57.99,
  genre: 'platformer',
  multiplatform: false,
)

nintendo.games.create!(
  game_name: 'Legend of Zelda',
  game_cost: 59.99,
  genre: 'action-adventure',
  multiplatform: false,
)

sony.games.create!(
  game_name: 'Spyro the Dragon',
  game_cost: 49.99,
  genre: 'platformer',
  multiplatform: false,
)

sony.games.create!(
  game_name: 'Crash Bandicoot',
  game_cost: 59.99,
  genre: 'action-platformer',
  multiplatform: true,
)

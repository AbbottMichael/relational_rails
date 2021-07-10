# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Motorcycle.destroy_all
MotorcycleManufacturer.destroy_all

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

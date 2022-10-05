# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Post.create(
  title: "Getting Started with Rails", 
  summary: "A brief overview on how to get started with using Ruby on Rails.", 
  content: "Content for the article goes here."
)

Post.create(
  title: "Getting Started with Django", 
  summary: "A brief overview on how to get started with using Django.", 
  content: "Content for the article goes here."
)

Post.create(
  title: "Getting Started with Ruby", 
  summary: "A brief overview on how to get started with using Ruby.", 
  content: "Content for the article goes here."
)

Post.create(
  title: "Getting Started with Python", 
  summary: "A brief overview on how to get started with using Python.", 
  content: "Content for the article goes here."
)

Post.create(
  title: "", 
  summary: "", 
  content: ""
)
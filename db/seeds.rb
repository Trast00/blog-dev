# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', email: 'dickoallassane1997@gmail.com', encrypted_password: "test123456")
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')

Post.create(author: first_user, title: 'Hello2', text: 'This is my first post')
Post.create(author: first_user, title: 'Hello3', text: 'This is my first post')
Post.create(author: first_user, title: 'Hello4', text: 'This is my first post')
first_like = Like.create(post: first_post, author: first_user)


Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: first_user, text: 'Hi Alice! How are you' )
Comment.create(post: first_post, author: second_user, text: 'Fine thanks, and you' )
Comment.create(post: first_post, author: first_user, text: 'Fine too!' )
Comment.create(post: first_post, author: second_user, text: 'Will you marry me !?' )
Comment.create(post: first_post, author: first_user, text: 'No!' )
Comment.create(post: first_post, author: first_user, text: 'Sorry' )
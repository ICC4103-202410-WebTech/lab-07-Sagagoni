# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

PostTag.delete_all
Post.delete_all
Tag.destroy_all
User.delete_all

users = [
  User.create!(
    name: "Felipe Rios", 
    email: "feliperiosvo@gmail.com",
    password: 'Felipe123'
  ),

  User.create!(
    name: "Mikaela Stambuk", 
    email: "mstambuk@gmail.com", 
    password: 'perritos1'
  ),

  User.create!(
    name: "Javier De Bernardi", 
    email: "Jdebernardi@gmail.com", 
    password: 'autos14'
  ),

  User.create!(
    name: "Beatriz Valdes", 
    email: "bvaldes@hotmail.com", 
    password: 'ninos23'
  ),

  User.create!(
    name: "John Doe", 
    email: "Jdoe@gmail.com", 
    password: 'lala23'
  )
]


tags = [Tag.create!(
    name: 'Mascotas'
  ),

  Tag.create!(
    name: 'Nieve'
  ),

  Tag.create!(
    name: 'Famosos'
  ),

  Tag.create!(
    name: 'Formula1'
  ),

  Tag.create!(
    name: 'Publicidad'
  ),]

posts_data = [
  {
    title: "Mis animales",
    content: "Consejos para mejorar la vida de tu mascota: ",
    published_at: Time.current,
    user: users[0],  # Felipe Rios
    tags: [tags[0]]  # Mascotas
  },
  {
    title: "Aventuras en la nieve",
    content: "Todo lo que necesitas saber para tu próxima aventura en la nieve.",
    published_at: Time.current,
    user: users[1],  # Mikaela Stambuk
    tags: [tags[1]]  # Nieve
  },
  {
    title: "Encuentros con famosos",
    content: "Taylor Swift y Lady gaga",
    published_at: Time.current,
    user: users[2],  # Javier De Bernardi
    tags: [tags[2]]  # Famosos
  },
  {
    title: "Fórmula 1: Carreras y pasión",
    content: "Max Verstappen una vez mas en la cima",
    published_at: Time.current,
    user: users[3],  # Beatriz Valdes
    tags: [tags[3]]  # Formula1
  },
  {
    title: "Post 1",
    content: "Publicidad porque algun dia sere famoso",
    published_at: Time.current,
    user: users[4],  # John Doe
    tags: [tags[4], tags[2]]  # Publicidad
  },

  {
    title: "Vida Silvestre",
    content: "Me gustan los animales y la montana",
    published_at: Time.current,
    user: users[0],  # Felipe Rios, giving another post to the first user
    tags: [tags[0], tags[1]]  # Mascotas and Nieve
  },
  {
    title: "Deportes de invierno",
    content: "queda poco para poder esquiar",
    published_at: Time.current,
    user: users[1],  # Mikaela Stambuk
    tags: [tags[1]]  # Nieve
  },
  {
    title: "Post 1",
    content: "Donde encontrar famosos facilmente: lugares...",
    published_at: Time.current,
    user: users[2],  # Javier De Bernardi
    tags: [tags[2]]  # Famosos
  },
  {
    title: "Formula 1 ",
    content: "Fin de semana de carrera, a prepararse ",
    published_at: Time.current,
    user: users[3],  # Beatriz Valdes
    tags: [tags[3]]  # Formula1
  },
  {
    title: "Estrategias de Marketing",
    content: "importante",
    published_at: Time.current,
    user: users[4],  # John Doe
    tags: [tags[4]]  # Publicidad
  }
]


posts_data.each do |post_info|
  post = Post.create!(
    title: post_info[:title],
    content: post_info[:content],
    published_at: post_info[:published_at],
    user: post_info[:user]
  )

  post_info[:tags].each do |tag|
    PostTag.create!(
      post: post,
      tag: tag
    )
  end
end

puts "Posts created and associated with users and tags successfully!"

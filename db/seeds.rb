require 'faker'
Genre.destroy_all
Movie.destroy_all

puts 'Creating 10 fake genres...'

genreList = ['Action', 'Adventure', 'Comedy', 'Crime', 'Drama', 'Fantasy',
            'Historical', 'Horror', 'Mystery', 'Philosophical', 'Political',
            'Romance', 'Satire', 'Sci-Fi', 'Thriller', 'Western']

genreList.each do |item|
  genreInstance = Genre.new(
    name: item,
    url: Faker::LoremFlickr.image(size: "300x200", search_terms: ['movies'])
  )
  genreInstance.save!

  puts 'Succesfully created 10 genres'
  puts "Creating 10 fake movies for #{item}"

  10.times do
    movieInstance = Movie.new(
      title: Faker::Book.title,
      rating: rand(2..5.0).round(1),
      director: Faker::Name.name,
      year: rand(1960..2020),
      duration: rand(90..180),
      synopsys: Faker::Lorem.paragraphs,
      url: Faker::LoremFlickr.image(size: "300x200", search_terms: ['movies']),
      genre_id: genreInstance.id
    )
    movieInstance.save!
  end
  puts 'Succesfully created 10 movies for #{item}'
end
puts 'Finished!'

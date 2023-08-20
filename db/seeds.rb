user  = User.create!(name: 'joão')

Tag.create!(name: 'ruby')
Tag.create!(name: 'rails')
Tag.create!(name: 'javascript')
Tag.create!(name: 'react')
Tag.create!(name: 'python')

User.first.tags << Tag.all

user.update(embeddings: user.calculate_embedding())
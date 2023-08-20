class AddUser < SeedMigration::Migration
  def up
    user  = User.create!(name: 'joão')

    tags = [
      Tag.create!(name: 'fuvest'),
      Tag.create!(name: 'psicologia'),
      Tag.create!(name: 'bbb'),
      Tag.create!(name: 'netflix'),
      Tag.create!(name: 'tcc')
    ]

    # like coronavirus saving
    content = Content.find_by! slug: 'universidades-desenvolvem-jogo-sobre-pandemia-coronavirus'
    UserContentClassification.create!(user_id: user.id, content_id: content.id, classification: 'like')

    user.tags << tags

    user.update(embeddings: user.calculate_embedding())
  end

  def down

  end
end

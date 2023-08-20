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

    user.tags << tags

    user.update(embeddings: user.calculate_embedding())
  end

  def down

  end
end

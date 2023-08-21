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
    content = Content.find_by slug: 'universidades-desenvolvem-jogo-sobre-pandemia-coronavirus'
    unless content.present?
      content = Content.new(slug: 'universidades-desenvolvem-jogo-sobre-pandemia-coronavirus')
      content.category = 'Universidades'
      content.body = """
        Em meio à pandemia de coronavírus, as universidades têm se destacado não apenas como centros de pesquisa, mas também como fontes de educação e sensibilização. Uma abordagem inovadora tem sido o desenvolvimento de jogos educativos que abordam os desafios da pandemia. Unindo conhecimentos em saúde pública e tecnologia de jogos, esses jogos visam informar e engajar o público.

        Esses jogos oferecem uma maneira interativa e acessível de transmitir informações complexas sobre o vírus e suas medidas de prevenção. Ao usar elementos de gamificação, como desafios e recompensas, os jogos incentivam os jogadores a adotar comportamentos saudáveis, como o uso de máscaras e o distanciamento social. Além disso, eles podem combater a desinformação e o estigma relacionados à pandemia.

        Os jogos desenvolvidos pelas universidades demonstram como a tecnologia e a educação podem se unir para enfrentar desafios globais. Ao abordar a pandemia por meio de uma abordagem lúdica e educativa, as universidades estão desempenhando um papel crucial na conscientização pública e na promoção de comportamentos que contribuem para a contenção da pandemia.
      """
     content_embedding = EmbeddingCalculator.new.calculate_embedding(content.body)
      content.embedding = content_embedding
      content.save!
    end

    UserContentClassification.create!(user_id: user.id, content_id: content.id, classification: 'like')

    user.tags << tags

    user.update(embedding: user.calculate_embedding())
  end

  def down

  end
end

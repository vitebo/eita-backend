class PopulateImageOnContent
  def initialize
    category_map = {
      "Curiosidades": 'curious people',
      "Cursos Técnicos": 'technical courses',
      "Profissões": 'professionals',
      "Universidades": 'universities',
      "Ensino Básico": 'high school',
      "Idiomas": 'languages',
      "Vestibular e Enem": 'university exams',
      "Especiais": 'random things',
      "Pós-graduação": 'future',
      "+ Níveis de Ensino": 'education',
    }

    Content.all.each do |content|
      next if content.category.blank?
      image = ImageGenerator.new.generate_image(category_map[content.category])

      content.update(image_url: image) if image.present?
    end
  end
end

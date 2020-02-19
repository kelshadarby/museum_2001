class Museum

  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    matching_exhibits = []
    @exhibits.map do |exhibit|
      patron.interests.map do |interest|
        if interest == exhibit.name
          matching_exhibits << exhibit
        end
      end
    end
    matching_exhibits
  end

end

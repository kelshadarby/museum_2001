class Museum

  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibit_hash = {}
    @exhibits.each do |exhibit|
      exhibit_hash[exhibit] = [] if exhibit_hash[exhibit].nil?
      @patrons.each do |patron|
        recommend_exhibits(patron).each do |recommend_exhibit|
          if recommend_exhibit == exhibit
          exhibit_hash[exhibit] << patron
          end
        end
      end
    end
    exhibit_hash
  end

end


# ticket_lottery_contestants returns an array of patrons that do not have enough
#  money to see an exhibit, but are interested in that exhibit. The lottery winner
#   is generated randomly based on the available contestants when draw_lottery_winner
#    is called.
# You will need to use a stub to test the announce_lottery_winner method in
# conjunction with the draw_lottery_winner method. JOY!

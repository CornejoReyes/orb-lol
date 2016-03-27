class Orb
  class Champion
    attr_accessor :attack, :defense, :difficulty, :id, :magic, :name

    def initialize(data)
      @active = data["active"]
      @attack = data["attackRank"]
      @defense = data["defenseRank"]
      @difficulty = data["difficultyRank"]
      @free_to_play = data["freeToPlay"]
      @id = data["id"]
      @magic = data["magicRank"]
      @name = data["name"]
      @available = data["rankedPlayEnabled"]
    end

    def is_active?
      @active
    end

    def has_bot?
      @has_bot
    end

    def has_mm_bot?
      @has_mm_bot
    end

    def is_free_to_play?
      @free_to_play
    end

    def available_in_ranked?
      @available
    end
  end
end

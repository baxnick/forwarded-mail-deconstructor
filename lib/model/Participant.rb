module Model
  class Participant
    attr_reader :full_name, :email

    def self.find_or_create(name, incoming_email)
      found = Participant.all.find { |p| p.email == incoming_email }

      unless found
        found ||= Participant.new(name, incoming_email)
        Participant.all << found
      end

      found
    end

    def self.all
      @@_participants ||= Array.new
    end

    def initialize(name, email)
      @full_name = name
      @email = email
    end
  end
end


module NameOfPerson
  class PersonName < String
    attr_reader :first, :last

    def self.full(full_name)
      first, last = full_name.to_s.squish.split(/\s/, 2)
      new(first, last) if first.present?
    end

    def initialize(first, last = nil)
      raise ArgumentError, "First name is required" if first.blank?

      @first = first
      @last = last
      super(full)
    end

    def full
      @full ||= last.present? ? "#{first} #{last}" : first
    end
  end
end

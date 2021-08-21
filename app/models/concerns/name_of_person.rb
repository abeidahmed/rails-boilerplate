module NameOfPerson
  def name=(name)
    full_name = PersonName.full(name)
    self.first_name = full_name&.first
    self.last_name = full_name&.last
  end

  def name
    PersonName.new(first_name, last_name) if first_name.present?
  end
end

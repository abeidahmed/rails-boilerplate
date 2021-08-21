class ErrorSerializer
  def self.serialize(errors)
    new(errors).accumulate if errors
  end

  def initialize(errors)
    @errors = errors
  end

  def accumulate
    json = {}
    json[:errors] = @errors.to_hash.map { |key, val| render_errors(errors: val, type: key) }.flatten
    json
  end

  private

  def render_errors(errors:, type:)
    errors.map do |msg|
      { type: type, detail: "#{type.to_s.humanize} #{msg}" }
    end
  end
end

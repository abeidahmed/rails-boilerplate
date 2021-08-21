module ResponseHelper
  def json
    JSON.parse(response.body, symbolize_names: true)
  end

  def error_types(errors = json[:errors])
    errors.map { |error| error[:type].to_sym }.uniq
  end
end

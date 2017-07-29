class Formatter
  def self.capitalize_all(params)
    params.each do |key, value|
      params[key] = value.capitalize
    end
  end
end

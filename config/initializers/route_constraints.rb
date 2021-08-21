class AdminConstraint
  def self.matches?(request)
    request.env["warden"].user&.admin?
  end
end

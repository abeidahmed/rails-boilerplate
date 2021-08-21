class ApplicationRecord < ActiveRecord::Base
  include Normalize

  self.abstract_class = true
end

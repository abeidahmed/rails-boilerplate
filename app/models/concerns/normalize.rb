module Normalize
  extend ActiveSupport::Concern

  class_methods do
    def normalize(*args, &block)
      options = args.extract_options!
      normalizers = [block, options[:with]].flatten.compact

      before_validation do
        args.each { |field| send("#{field}=", normalized_value(field, normalizers)) }
      end
    end
  end

  private

  def normalized_value(field, normalizers)
    value = send(field).to_s

    normalizers.each do |normalizer|
      value = if normalizer.respond_to?(:call)
                normalizer.call(value)
              elsif value.respond_to?(normalizer)
                value.send(normalizer)
              end
    end

    value
  end
end

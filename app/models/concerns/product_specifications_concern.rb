module ProductSpecificationsConcern
  extend ActiveSupport::Concern

  Specification.specification_types.keys.each do |method_name|
    define_method(method_name) do
      specifications.send(method_name)&.last&.spec_attributes || {}
    end
  end
end
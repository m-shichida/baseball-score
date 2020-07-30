module ApplicationHelper
  def t_ar(attribute)
    model_name = attribute.split('.')[0].underscore.delete("\b")
    attribute = attribute.split('.')[1]

    attribute.nil? ? t("activerecord.models.#{model_name}") : t("activerecord.attributes.#{model_name}.#{attribute}")
  end
end

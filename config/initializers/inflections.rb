# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
# Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural /(.*)([lrnd])$/i, '\1\2es'
  inflect.singular /(.*)([lrnd])es$/i, '\1\2'
  inflect.plural /(.*)(ox)$/i, '\1\2en'
  inflect.singular /(.*)(ox)en/i, '\1\2'
  inflect.plural /(.*)([aiou])$/i, '\1\2s'
  inflect.singular /(.*)([aiou])s$/i, '\1\2'
  inflect.plural /(.*)z$/i, '\1ces'
  inflect.singular /(.*)ces$/i, '\1z'
  inflect.irregular 'user', 'users'
  inflect.irregular 'pais', 'paises'
  inflect.irregular 'sessions', 'sessions'
end
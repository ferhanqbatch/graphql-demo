require 'search_object/plugin/graphql'

class Resolvers::MobilesSearch
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)

  # scope is starting point for search
  scope { Mobile.all }

  # return type
  type !types[Types::MobileType]

  # inline input type definition for the advance filter
  MobileFilter = GraphQL::InputObjectType.define do
    name 'MobileFilter'

    argument :OR, -> { types[MobileFilter] }
    argument :id, types.ID
    argument :name_contains, types.String
    argument :size_contains, types.String
    argument :price_eq, types.Int
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: MobileFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    # normalize filters from nested OR structure, to flat scope list
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    # add like SQL conditions
    scope = Mobile.all
    scope = scope.where(id: value['id'] ) if value['id']
    scope = scope.where('name LIKE ?', "%#{value['name_contains']}%") if value['name_contains']
    scope = scope.where('size LIKE ?', "%#{value['size_contains']}%") if value['size_contains']
    scope = scope.where('price = ?', "%#{value['price_eq']}%") if value['price_eq']

    branches << scope

    # continue to normalize down
    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end

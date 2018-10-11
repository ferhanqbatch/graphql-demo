Types::MobileType = GraphQL::ObjectType.define do
  # this type is named `Link`
  name 'Mobile'

  # it has the following fields
  field :id, !types.ID
  field :name, types.String
  field :size, types.String
  field :price, types.Int
  field :links, types[Types::LinkType] do
    resolve -> (obj, args, ctx) {
      obj.links
    }
  end
end

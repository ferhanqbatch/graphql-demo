class Resolvers::UpdateMobile < GraphQL::Function
  argument :id, !types.ID
  argument :name, types.String
  argument :size, types.String
  argument :price, types.Int

  type Types::MobileType

  def call(_obj, args, _ctx)
    mobile = Mobile.find_by(id: args['id'])
    mobile.update!(
      name: args[:name],
      size: args[:size],
      price: args[:price]
    )
    mobile
  end
end

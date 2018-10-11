class Resolvers::CreateMobile < GraphQL::Function
  argument :name, !types.String
  argument :size, types.String
  argument :price, !types.Int

  type Types::MobileType
  
  def call(_obj, args, _ctx)
    Mobile.create!(
      name: args[:name],
      size: args[:size],
      price: args[:price]
    )
  end
end

class Resolvers::DeleteMobile < GraphQL::Function
  argument :id, !types.ID

  type Types::MobileType

  def call(_obj, args, _ctx)
    mobile = Mobile.find_by(id: args['id'])
    mobile.destroy if mobile
  end
end

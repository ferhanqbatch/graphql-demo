Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createMobile, function: Resolvers::CreateMobile.new
  field :updateMobile, function: Resolvers::UpdateMobile.new
  field :deleteMobile, function: Resolvers::DeleteMobile.new
end

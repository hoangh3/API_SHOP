class ErrorSerializer < ActiveModel::Serializer
  # attributes status: 422, errors: self.errors.full_messages
end

class CompanySerializer < ApplicationSerializer
  attributes :id, :name, :document

  has_many :receivables

  attribute :created_at do |object|
    object.created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  attribute :updated_at do |object|
    object.updated_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end

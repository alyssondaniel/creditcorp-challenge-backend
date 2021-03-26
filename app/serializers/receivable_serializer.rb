class ReceivableSerializer < ApplicationSerializer
  attributes :id, :company_id, :net_value, :key

  attribute :value_antecipation do |object, params|
    object.calc_antecipation(params[:tax]).to_f.ceil(2)
  end

  attribute :expired_at do |object|
    object.expired_at.strftime('%d/%m/%Y')
  end

  attribute :created_at do |object|
    object.created_at.strftime('%d/%m/%Y %H:%M:%S')
  end

  attribute :updated_at do |object|
    object.updated_at.strftime('%d/%m/%Y %H:%M:%S')
  end

  attribute :company_name do |object|
    object.company.name
  end
end

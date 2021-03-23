class ReceivableSerializer < ApplicationSerializer
  attributes :id, :company_id, :net_value, :expired_at, :key

  attribute :value_antecipation do |object, params|
    object.calc_antecipation(params[:tax]).to_f.ceil(2)
  end

  attribute :created_at do |object|
    object.created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  attribute :updated_at do |object|
    object.updated_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end

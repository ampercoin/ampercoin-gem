ActiveRecord::Schema.define do
  create_table :accounts do |t|
    t.string :public_key
    t.string :private_key
  end
end

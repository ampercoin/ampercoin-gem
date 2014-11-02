ActiveRecord::Schema.define do
  create_table :addresses do |t|
    t.string :public_key
    t.string :private_key
  end
end

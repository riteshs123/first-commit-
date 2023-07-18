class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :cart
end

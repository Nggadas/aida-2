class Memo < ApplicationRecord
  validates :title, length: { in: 3..20 }
  validates :content, length: { minimum: 3}
end

class Memo < ApplicationRecord
  belongs_to :user

  validates :title, length: { in: 3..20 }, presence: true
  validates :content,  length:{ minimum: 3}, presence: true
end

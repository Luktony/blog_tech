class Tag < ApplicationRecord
    has_many :posts,dependent: :restrict_with_error
    validates :name, presence: true, length: { minimum: 3, maximum: 20 }
    scope :sorted, -> { order(name: :asc) }
end

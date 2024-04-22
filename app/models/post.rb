class Post < ApplicationRecord
    belongs_to :user
    belongs_to :tag
    
    validates :title, presence: true, length: { minimum: 5 }
    validates :body, presence: true, length: { minimum: 10 }

    scope :filter_by_tags, -> (tag) { where tag_id: tag.id if tag.present?  }
end



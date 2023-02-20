class Article < ApplicationRecord
    belongs_to :category
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    
    validates :title, :description , :text_content, presence: true
end

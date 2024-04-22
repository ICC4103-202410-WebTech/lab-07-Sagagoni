class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags

    belongs_to :parent_post, class_name: 'Post', optional: true
    has_many :child_posts, class_name: 'Post', foreign_key: 'parent_post_id', dependent: :destroy

    #validaciones 
    validates :title, presence: { message: "We don't allow posts without a title" }
    validates :content, presence: { message: "Error: you can't post 'nothing', please add content " }
    validates :user_id, presence: { message: "Oh no! Post must have a user." }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "Answers count can't be negative." }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "Likes count can't be negative." }
    validates :published_at, presence: { message: "Published date must be set, please try to fix it" }
  
    before_validation :set_default_published_at

    private

    def set_default_published_at
        self.published_at ||= Time.current
    end

end
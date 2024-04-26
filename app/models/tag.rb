class Tag < ApplicationRecord
    self.table_name = 'table_tags'
    has_many :post_tags
    has_many :posts, through: :post_tags

    validates :name, presence: { message: "Tag name can't be blank! " }, uniqueness: { message: "Tag name must be unique." }


end 

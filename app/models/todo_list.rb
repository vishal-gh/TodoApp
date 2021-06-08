class TodoList < ApplicationRecord
    validates :title, presence: true
    validates :description, presence:true  
    has_many :todo_items
    has_many :tags, through: :todo_items

end

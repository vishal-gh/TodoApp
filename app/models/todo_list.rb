class TodoList < ApplicationRecord
    validates :title, presence: true
    validates :description, presence:true  
    has_many :todo_items
    has_many :tags, through: :todo_items


    def GetItems

        items = ""

        todo_items.each do |x|
            items << x.name + "<br>"  
        end

        if items.length > 0
            items.delete_suffix(", ")
        else
            ""
        end

    end

end

module TodoListsHelper

    
    def TodoListsHelper.GetItems(todo_list)

        items = ''

        todo_list.todo_items.each do |item|
            items << item.name + '<br>'
        end

        if items.length > 0
            items.delete_suffix(', ')
        else
            ""
        end

    end

end

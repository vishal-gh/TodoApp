module TodoItemsHelper

    def TodoItemsHelper.GetTags(todo_item)
      
        tagnames = ''
  
        todo_item.tags.each do |tag|
           tagnames << tag.tagname + ', '
        end
  
        if tagnames.length > 0
           tagnames.delete_suffix(', ')
        else
            ''
        end
  
     end

end

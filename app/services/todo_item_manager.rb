class TodoItemManager
 
    def self.SaveTags(todo_item, params)

        unless todo_item.new_record?
  
            todo_item.tags.destroy_all
  
        end
  
        tagnames = params[:tagname].split(',')
  
        tagnames.each do |tag|
              
            todo_item.tags.create!(tagname: tag)
          
        end
  
     end

end
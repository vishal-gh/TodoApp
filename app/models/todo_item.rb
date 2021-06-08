class TodoItem < ApplicationRecord
   validates :name, presence: true
   belongs_to :todo_list
   has_many :tags

   def SaveTags(params)

      unless self.new_record?

         tags.destroy_all

      end

      tagnames = params[:tagname].split(",")

      tagnames.each do |tag|
            
            tags.create!(tagname: tag)
        
      end

   end
   
  
   def GetTags
      
      tagnames = ''

      tags.each do |tag|
         tagnames << tag.tagname + ', '
      end

      if tagnames.length > 0
         tagnames.delete_suffix(', ')
      else
          ''
      end


   end
   
end

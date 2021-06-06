class TodoItem < ApplicationRecord
   validates :name, presence: true
   belongs_to :todo_list
   has_many :tags

   def SaveTags(params)

      tagnames = params[:tagname].split(",")

      tagnames.each do |x|

            newhash = Hash.new
            newhash[:tagname] = x
            tags.create(newhash)
        
      end

   end
   
   def DeleteTags

      tags.each do |x|

         x.destroy

      end
      
   end

   def GetTags

      
      tagnames = ""

      tags.each do |x|
         tagnames << x.tagname + ", "  
      end

      if tagnames.length > 0
         tagnames.delete_suffix(", ")
      else
          ""
      end


   end
   
end

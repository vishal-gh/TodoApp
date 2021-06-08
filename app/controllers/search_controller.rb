class SearchController < ApplicationController

    def index   
                
        if request.post?            
            
            @tags = params[:keyword].split(',')
            @tags.map! {|tag| '%' + tag.downcase + '%' }           
            @todoitems = TodoItem.distinct.select('todo_items.*').joins(:tags).where('lower(tags.tagname) like ?', @tags)

        end

    end    



end

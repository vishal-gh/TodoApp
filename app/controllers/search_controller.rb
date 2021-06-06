class SearchController < ApplicationController

    def index   
                
        if request.post?            
            
            @tags = params[:keyword].split(",")

            @searchquery = String.new
            
            @tags.each do |q|

                if !q.empty?

                    @searchquery << " tagname like '%" + q + "%' OR "

                end                

            end
            
            if @searchquery.length > 0
                @searchquery = @searchquery.delete_suffix(" OR ")
            end

            @todoitems = TodoItem.find_by_sql("Select todo_items.* from todo_items where id in (select todo_item_id from tags where " + @searchquery + ")")
            #@todoitems = TodoItem.find_by_sql(["Select todo_items.* from todo_items where id in (select todo_item_id from tags where ?)",@searchquery])

        end

    end    



end

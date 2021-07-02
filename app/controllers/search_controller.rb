class SearchController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index   
                
        if request.post?            
            
            @tags = params[:keyword].split(',')
            @tags.map! {|tag| '%' + tag.downcase + '%' }           
            @todoitems = TodoItem.distinct.select('todo_items.*').joins(:tags).where('lower(tags.tagname) like ?', @tags)


            returnlist = []

            @todoitems.each do |item|
            
                list = {
                id: item.id,
                name: item.name,
                completed: item.completed == true ? 'Yes' : 'No' ,
                datecompleted: item.datecompleted,
                isrecurring: item.isrecurring == true ? 'Yes' : 'No',
                tags: item.tags
            }
            returnlist << list

            end       


            render json:returnlist


        end

    end    



end

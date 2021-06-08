require 'date'

class TodoItemsController < ApplicationController
    before_action :set_todo_list
    before_action :set_todo_item, except: [:index, :create]
   
    def show
    end

    def index
        
        @dropdown_items = TodoList.all.where("id <> " + @todo_list.id.to_s)        
        @todoitems = @todo_list.todo_items.all.includes(:tags)

    end

    def edit
        
        if request.patch?
   
            if @todoitem.update(todo_items_params_edit[:todo_item])

                @todoitem.SaveTags(todo_items_params_edit)    
                flash[:topnotice] = 'Todo item updated successully.'
                redirect_to todo_list_todo_items_path(@todo_list)
                
            else

                render 'edit'

            end    

        end     
        
    end
  
    def create

        unless todo_items_params[:name].empty?
            
            @todo_item = @todo_list.todo_items.create(todo_items_params)
           
            if @todo_item.id > 0

                @todo_item.SaveTags(params.permit(:tagname))
                
            else

                flash[:errors] = "Unknown error occured"

            end

            redirect_to todo_list_todo_items_path(@todo_list)
            
        else
            
            flash[:errors] = "Name can't be blank"
            redirect_to todo_list_todo_items_path(@todo_list)

        end

    end

    def destroy
        
        @todoitem.destroy
        flash[:topnotice] = 'Item deleted successully.'
        redirect_to todo_list_todo_items_path(@todo_list)

    end

    def move
        
        @todoitem.update(todo_list_id: params[:newtodo])
        flash[:topnotice] = 'Item moved successully.'
        redirect_to todo_list_todo_items_path(@todo_list)

    end

    def complete
        
        @todoitem.update(completed: true, datecompleted: DateTime.now)
        flash[:topnotice] = 'Marked as completed successully.'
        redirect_to todo_list_todo_items_path(@todo_list)

    end

    def incomplete
        
        @todoitem.update(completed: false, datecompleted: nil)
        flash[:topnotice] = 'Marked as incomplete successully.'
        redirect_to todo_list_todo_items_path(@todo_list)

    end
    
    private

    def set_todo_list
        
        @todo_list = TodoList.find(params[:todo_list_id])

    end

    def set_todo_item
        
        @todoitem = @todo_list.todo_items.find(params[:id])

    end

    def todo_items_params
        
        params.permit(:name,:isrecurring)

    end

    def todo_items_params_edit
        
        params.permit(:tagname, todo_item: {})

    end    


end

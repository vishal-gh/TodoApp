require 'date'

class TodoItemsController < ApplicationController
    before_action :set_todo_list
    #before_action :set_todo_item, except: [:create]
   
    def show
    end

    def index
        @todoitems = @todo_list.todo_items.all        
    end

    def edit        
        set_todo_item
    end

    def edit_new
        
        set_todo_item
        
        if !params[:todo_item][:name].empty?

            params.permit!

            @todoitem.update(params[:todo_item])
            
            @todoitem.DeleteTags
            
            @todoitem.SaveTags(params)

            flash[:topnotice] = "Todo Item updated successully."

            redirect_to todo_list_todo_items_path(@todo_list)

        else
            redirect_to todo_list_todo_items_path(@todo_list)
        end
        
    end

    def create

        if !todo_items_params[:name].empty?
            
            @todo_item = @todo_list.todo_items.create(todo_items_params)
           
            @todo_item.SaveTags(params)

            redirect_to todo_list_todo_items_path(@todo_list)

        else
            redirect_to todo_list_todo_items_path(@todo_list)
        end

    end

    def update                    
        
        if !params[:name].empty?

            @todo_item.update(params)
            
            @todo_item.DeleteTags
            
            @todo_item.SaveTags(params)

            redirect_to todo_list_todo_items_path(@todo_list)

        else
            redirect_to todo_list_todo_items_path(@todo_list)
        end


    end


    def destroy
        set_todo_item
        @todoitem.destroy
        flash[:topnotice] = "Item deleted successully."
        redirect_to todo_list_todo_items_path(@todo_list)
    end

    def move
        set_todo_item
        @todoitem.update(todo_list_id: params[:newtodo])
        flash[:topnotice] = "Item moved successully."
        redirect_to todo_list_todo_items_path(@todo_list)
    end

    def update
    end

    def complete
        set_todo_item
        @todoitem.update(completed: true, datecompleted: DateTime.now)
        flash[:topnotice] = "Marked as completed successully."
        redirect_to todo_list_todo_items_path(@todo_list)
    end

    def incomplete
        set_todo_item
        @todoitem.update(completed: false, datecompleted: nil)
        flash[:topnotice] = "Marked as incomplete successully."
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


end

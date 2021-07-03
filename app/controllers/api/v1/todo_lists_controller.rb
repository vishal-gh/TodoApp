module Api::V1

class TodoListsController < ApplicationController    
    before_action :set_todo_list, only: %i[ show edit update destroy ]
    skip_before_action :verify_authenticity_token
        
    def index
        
        @todolists = TodoList.all.includes(:todo_items).order(id: :asc)

        returnlist = []

        @todolists.each do |item|
           list = {
               id: item.id,
               title: item.title,
               description: item.description,
               todo_items: item.todo_items
           }
           returnlist << list
        end       

        render json: returnlist

    end

    def new 
        
        @todolist = TodoList.new

    end

    def edit
    end

    def show
    end

    def create
        
        @todolist = TodoList.new(todolist_params)

        if @todolist.save
            
            #flash[:topnotice] = 'New todo list has been created successfully.'                
            #format.html { redirect_to todo_lists_path }
            render json: {message: 'Successfully created'}, status: :ok

        else
            
            render json: @todolist.errors, status: :unprocessable_entity
            #format.html { render :new}

        end      

    end

    def update

        #respond_to do |format|

            if @todolist.update(todolist_params)

                render json: {message: 'Successfully updated'}, status: :ok
                #flash[:topnotice] = 'The todo list has been updated.'
                #format.html { redirect_to todo_lists_path }

            else
                
                #format.html { render :new}
                render json: @todolist.errors, status: :unprocessable_entity


            end
            
        #end

    end
   
    def destroy
        
        if @todolist.destroy            
            
            render json: {message: 'Successfully deleted'}, status: :ok
            #flash[:topnotice] = 'The todo list has been deleted.'

        else
            
            render json: @list.errors, status: :unprocessable_entity
            #flash[:topnotice] = 'Delete failed'

        end

        #redirect_to todo_lists_path

    end

    private

    def todolist_params
        
        params.require(:todo_list).permit(:title,:description)
        
    end

    def set_todo_list
        
        begin
            
            @todolist = TodoList.find(params[:id])

        rescue Exception => e
            
            @todolist = TodoList.new            
            @todolist.errors.add(:base,'Record does not exist')            
            render 'new'

        end      
        
    end

end

end
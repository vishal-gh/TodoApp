class TodoListsController < ApplicationController
    before_action :set_todo_list, only: %i[ show edit update destroy ]
    
    def index
        
        @todolists = TodoList.all.includes(:todo_items).order(:id => :asc)

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

        respond_to do |format|

            if @todolist.save
                
                flash[:topnotice] = 'New todo list has been created successfully.'                
                format.html { redirect_to todo_lists_path }

            else
                
                format.html { render :new}

            end

        end

    end

    def update

        respond_to do |format|

            if @todolist.update(todolist_params)

                flash[:topnotice] = 'The todo list has been updated.'
                format.html { redirect_to todo_lists_path }

            else
                
                format.html { render :new}

            end
            
        end

    end
   
    def destroy
        
        if @todolist.destroy            
            
            flash[:topnotice] = 'The todo list has been deleted.'

        else
            
            flash[:topnotice] = 'Delete failed'

        end

        redirect_to todo_lists_path

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

class TodoListsController < ApplicationController
    before_action :set_todo_list, only: %i[ show edit update destroy ]
    
    def index
        @todolists = TodoList.all.order(:id => :asc)
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
                flash[:topnotice] = "New todo list has been created successfully."
                format.html { redirect_to todo_lists_path }
            else
                format.html { render :new, status: :unprocessable_entity }
            end

        end

    end

    def update

        respond_to do |format|

            if @todolist.update(todolist_params)

                flash[:topnotice] = "The todo list has been updated."

                format.html { redirect_to todo_lists_path }

            else
                
                format.html { render :new, status: :unprocessable_entity }

            end


        end

    end
   
    def destroy
        @todolist.destroy
        flash[:topnotice] = "The todo list has been deleted."
        redirect_to todo_lists_path
    end

    private

    def todolist_params
        params.require(:todo_list).permit(:title,:description)
    end

    def set_todo_list
        @todolist = TodoList.find(params[:id])
    end

end

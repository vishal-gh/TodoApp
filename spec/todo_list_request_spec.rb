require "rails_helper"
require 'securerandom'


describe TodoList, type: :request do

    @todo_id = 0

    let(:valid_attributes) do
        {          
          'title' => 'New Todo - ' + SecureRandom.hex.to_s,
          'description' => 'This is a test description - ' + SecureRandom.hex.to_s
        }
    end
   
    describe 'Todo List /create' do
        context 'with valid parameters' do

            it 'create new todo' do

                expect do
                    todolist = TodoList.new(valid_attributes)
                    todolist.save
                end.to change(TodoList, :count).by(1)
        
            end
        end
    end


    describe 'Todo List /destroy' do
      
        it 'destroys the requested todo list' do
          todolist = TodoList.new(valid_attributes)
          todolist.save          
          expect do
          delete todo_list_url(todolist)
          end.to change(TodoList, :count).by(-1)
        end
    
        it 'redirects to the todo list' do
            todolist = TodoList.new(valid_attributes)
            todolist.save
            delete todo_list_url(todolist)
            expect(response).to redirect_to(todo_lists_url)
        end

      end
   

end
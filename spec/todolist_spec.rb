require "rails_helper"

describe TodoList, type: :model do

    it 'check for title' do
        
        todolist = TodoList.new(title: '', description: 'test description')

        expect(todolist).to_not be_valid
        
        todolist.title = "Test title"

        expect(todolist).to be_valid

    end


    it 'check for description' do
        
        todolist = TodoList.new(title: 'New ToDo', description: '')

        expect(todolist).to_not be_valid

        
        todolist.description = "Added"

        expect(todolist).to be_valid

    end

    


end
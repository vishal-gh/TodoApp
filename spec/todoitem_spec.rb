require "rails_helper"

describe TodoItem, type: :model do

    it 'check for name' do
      
        todoitem = TodoItem.new(name: '',completed: false, datecompleted: nil, todo_list_id: 13)

        expect(todoitem).to_not be_valid
        
        todoitem.name = "Test title"

        expect(todoitem).to be_valid

    end

    it 'check save' do
        
        todoitem = TodoItem.new(name: 'New Item - 2', todo_list_id: 13)

        todoitem.save

        expect(todoitem.id).to be_a(Integer)

    end

    


end
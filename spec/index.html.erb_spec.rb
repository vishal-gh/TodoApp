
require 'rails_helper'

RSpec.describe 'todo_lists/index', type: :view do
    before(:each) do
    assign(:todolists, TodoList.all)
  end

  it 'renders a list of todos' do
    render
    assert_select "div[class='wrapper']", count: 1
    assert_select "a[id='addnew']", count: 1
    assert_select "div[class='row']", count: TodoList.all.count
  end
end
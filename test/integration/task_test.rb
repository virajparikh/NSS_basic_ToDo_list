require 'test_helper'

class TaskItemsTest < ActionDispatch::IntegrationTest
    test "posting a new todo item" do 
        visit '/'
        click_link 'Create TODO'
        fill_in 'Title', with: 'My First Rails app TODO!'
        click_button 'Submit TODO'
        assert_include page.body, "Your TODO has now been saved!"
        visit '/tasks'
        assert_include page.body, 'My First Rails app TODO!'
    end
end

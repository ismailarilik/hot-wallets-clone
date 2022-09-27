# frozen_string_literal: true

require 'application_system_test_case'

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
    @user = users(:one)

    login_as(@user)
  end

  test 'visiting the index' do
    visit categories_url
    assert_selector 'h1', text: 'Categories'
  end

  test 'should create category' do
    visit categories_url
    click_on 'New category'

    select @category.context.capitalize, from: 'Context'
    fill_in 'Icon', with: @category.icon
    fill_in 'Name', with: @category.name
    click_on 'Create Category'

    assert_text 'Category was successfully created'
    click_on 'Back'
  end

  test 'should update Category' do
    visit category_url(@category)
    click_on 'Edit this category', match: :first

    select @category.context.capitalize, from: 'Context'
    fill_in 'Icon', with: @category.icon
    fill_in 'Name', with: @category.name
    click_on 'Update Category'

    assert_text 'Category was successfully updated'
    click_on 'Back'
  end

  test 'should not destroy Category because some Transaction objects has strict dependency to it' do
    visit category_url(@category)
    click_on 'Destroy this category', match: :first

    assert_text 'Cannot delete record because dependent transactions exist'
  end
end

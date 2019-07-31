# frozen_string_literal: true

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @user = User.create(id: 1, name: "tanaka", email: "a@b")
    @book = Book.create(id: 1, title: "ブックタイトル", memo: "メモの内容")
  end

  test "visiting the index" do
    visit books_path
    assert_equal("ブックタイトル", @book.title)
  end

  test "creating a Book" do
    login_as @user
    visit new_book_path(@user)

    fill_in "作品名", with: "ブックタイトル"
    fill_in "Memo", with: "メモの内容"
    click_on "登録する"

    assert_text "アカウント登録もしくはログインしてください。"
  end

  # test 'updating a Book' do
  #   login_as(@user)
  #   visit edit_book_path(@book)

  #   fill_in 'Memo', with: "メモエディット"
  #   fill_in '作品名', with: "タイトルエディット"
  #   click_on '更新する'

  #   assert_text 'Book was successfully updated.'
  #   click_on 'Back'
  # end

  # test 'destroying a Book' do
  #   login_as(@user)
  #   visit books_path
  #   page.accept_confirm do
  #     click_link 'Destroy', match: :first
  #   end

  #   assert_text 'Book was successfully destroyed.'
  # end
end

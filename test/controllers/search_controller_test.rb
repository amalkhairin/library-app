# frozen_string_literal: true

require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = bukus(:book1)
    @query = 'Laskar'
  end

  test 'should search book by title' do
    get "/search?title=#{@query}", as: :json
    assert_response :success
  end
end

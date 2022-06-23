# frozen_string_literal: true

require 'test_helper'

class BukuControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @buku = bukus(:book1)
  end

  test "should list all books" do 
    get '/buku', as: :json
    assert_response :success
  end

  test 'should show specific book' do 
    get buku_path(@buku), as: :json
    assert_response :success
  end
end

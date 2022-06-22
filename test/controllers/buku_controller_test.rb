# frozen_string_literal: true

require 'test_helper'

class BukuControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get buku_index_url
    assert_response :success
  end

  test 'should get show' do
    get buku_show_url
    assert_response :success
  end

  test 'should get update' do
    get buku_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get buku_destroy_url
    assert_response :success
  end
end

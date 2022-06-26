# frozen_string_literal: true

require 'test_helper'

class PeminjamanBukusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "Cristiano Ronaldo", username: 'ronaldo', email: 'ronaldo@gmail.com', telephone: '0888888888', password: 'ronaldo')
    @user.buku_ids = []
  end

  test 'user can borrow books if not more than two ' do
    @user.buku_ids = [1, 2]

    assert_response :success
  end
end

require "test_helper"

class BukuTest < ActiveSupport::TestCase
  setup do 
    @book1 = bukus(:book1)
  end

  test "bukus should be valid" do 
    assert @book1.valid?
  end
end

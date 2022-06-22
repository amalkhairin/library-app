require "test_helper"

class BukuTest < ActiveSupport::TestCase
  setup do 
    @book1 = bukus(:book1)
  end

  test "bukus should be valid" do 
    assert @book1.valid?
  end

  test "barcode should be present" do
    @book1.barcode = ""
    assert_not @book1.valid?
  end

  test "isbn should be present" do
    @book1.isbn = ""
    assert_not @book1.valid?
  end

  test "judul should be present" do
    @book1.judul = ""
    assert_not @book1.valid?
  end

  test "penulis should be present" do
    @book1.penulis = ''
    assert_not @book1.valid?
  end

end

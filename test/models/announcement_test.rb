# frozen_string_literal: true

require 'test_helper'

class AnnouncementTest < ActiveSupport::TestCase
  setup do
    @announcement = announcements(:announcement1)
  end

  test 'announcement should be valid' do
    @user2 = User.create(name: 'Gifar Kedua', 
                         email: 'halo2@example.com', 
                         username: 'gifaraja2',
                         telephone: '0812345678911', 
                         password: 'admin1', 
                         role_id: roles(:admin).id)
                         
    @announcement.user = @user2
    assert @announcement.valid?
  end

  test 'title announcement should be present' do
    @announcement.title = ''
    assert_not @announcement.valid?
  end

  test 'title announcement should not be too long' do
    @announcement.title = 'a' * 101
    assert_not @announcement.valid?
  end

  test 'announcement can have many categories' do
    category1 = announcement_categories(:category1)
    category2 = announcement_categories(:category2)
    @announcement.announcement_category_ids = [category1.id, category2.id]

    assert_includes(@announcement.announcement_categories, category1)
    assert_includes(@announcement.announcement_categories, category2)
  end
end

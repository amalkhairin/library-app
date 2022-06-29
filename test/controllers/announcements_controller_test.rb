require "test_helper"

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @announcement = announcements(:announcement1)

    @role1 = Role.create(role: 'admin')
    @role2 = Role.create(role: 'visitor')

    @user = User.create(name: 'Gifar', email: 'halo@example.com', username: 'gifaraja', telephone: '0812345678910',
                        password: 'admin1', role_id: 1)
    @user2 = User.create(name: 'Gifar Kedua', email: 'halo2@example.com', username: 'gifaraja2',
                         telephone: '0812345678911', password: 'admin1', role_id: 2)

    @admin_token = sign_in_as(@user)
    @user_token = sign_in_as(@user2)
  end

  test "should show announcement" do
    get announcement_path(@announcement), params: {}, headers: {HTTP_AUTHORIZATION: "#JWT #{@user_token}"}
    assert_response :success
  end

  test 'should create announcement if admin' do
    assert_difference('Announcement.count', 1) do
      post announcements_path, params: {title: "Libur Semester Ganjil"}, headers: { HTTP_AUTHORIZATION: "JWT #{@admin_token}" }
    end

    assert_response :success
  end
end

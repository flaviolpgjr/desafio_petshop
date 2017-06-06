require 'test_helper'

class PetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet = pets(:one)
  end

  test "should get index" do
    get pets_url, as: :json
    assert_response :success
  end

  test "should create pet" do
    assert_difference('Pet.count') do
      post pets_url, params: { pet: { birth: @pet.birth, breed: @pet.breed, castrated: @pet.castrated, genre: @pet.genre, last_time: @pet.last_time, name: @pet.name, owner_name: @pet.owner_name, owner_phone: @pet.owner_phone } }, as: :json
    end

    assert_response 201
  end

  test "should show pet" do
    get pet_url(@pet), as: :json
    assert_response :success
  end

  test "should update pet" do
    patch pet_url(@pet), params: { pet: { birth: @pet.birth, breed: @pet.breed, castrated: @pet.castrated, genre: @pet.genre, last_time: @pet.last_time, name: @pet.name, owner_name: @pet.owner_name, owner_phone: @pet.owner_phone } }, as: :json
    assert_response 200
  end

  test "should destroy pet" do
    assert_difference('Pet.count', -1) do
      delete pet_url(@pet), as: :json
    end

    assert_response 204
  end
end

require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chef_name: "bob", email: "bob@example.com")
    @recipe =@chef.recipes.build(name: "Chicken Parm", summary: "This is the best Chicken Parm recipe ever", 
    description: "Make some chicken parm by like frying chicken and putting sauce on it and stuff")
  end
  
  test "Recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "Name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name length should not be too short" do
    @recipe.name ="aaaa"
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end
  
  test "description length should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "description length should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
end
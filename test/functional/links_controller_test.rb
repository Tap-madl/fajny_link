require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Link.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Link.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Link.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to link_url(assigns(:link))
  end

  def test_edit
    get :edit, :id => Link.first
    assert_template 'edit'
  end

  def test_update_invalid
    Link.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Link.first
    assert_template 'edit'
  end

  def test_update_valid
    Link.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Link.first
    assert_redirected_to link_url(assigns(:link))
  end

  def test_destroy
    link = Link.first
    delete :destroy, :id => link
    assert_redirected_to links_url
    assert !Link.exists?(link.id)
  end
end

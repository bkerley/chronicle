require File.dirname(__FILE__) + '/../test_helper'

class AtomsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:atoms)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_atom
    assert_difference('Atom.count') do
      post :create, :atom => { }
    end

    assert_redirected_to atom_path(assigns(:atom))
  end

  def test_should_show_atom
    get :show, :id => atoms(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => atoms(:one).id
    assert_response :success
  end

  def test_should_update_atom
    put :update, :id => atoms(:one).id, :atom => { }
    assert_redirected_to atom_path(assigns(:atom))
  end

  def test_should_destroy_atom
    assert_difference('Atom.count', -1) do
      delete :destroy, :id => atoms(:one).id
    end

    assert_redirected_to atoms_path
  end
end

require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Link.new.valid?
  end
end

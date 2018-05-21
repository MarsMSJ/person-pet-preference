require 'test_helper'

class PersonPetExperimentText < ActiveSupport::TestCase

  def setup
    @ppe = PersonPetExperiment.new(height: "5.7", weight:"190")
  end

  test "should be valid" do
    assert @ppe.valid?
  end


end
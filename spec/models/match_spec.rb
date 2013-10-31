require 'spec_helper'

describe Match do
<<<<<<< HEAD
  pending "add some examples to (or delete) #{__FILE__}"
=======
  let (:match) { FactoryGirl.create(:contest_match) }
  subject { match }

  it { should respond_to(:completion) }
  it { should respond_to(:earliest_start) }
  it { should respond_to(:player_matches) }
  it { should respond_to(:players) }
  it { should respond_to(:manager) }

  describe "validations" do
    it { should be_valid }
    specify { expect_required_attribute(:manager) }
  end
>>>>>>> 4b4494008ef6b2840b0b84d13f14c267a47c118c
end

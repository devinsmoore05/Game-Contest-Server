require 'spec_helper'

describe PlayerMatch do
<<<<<<< HEAD
  pending "add some examples to (or delete) #{__FILE__}"
=======
  let (:player_match) { FactoryGirl.create(:player_match) }
  subject { player_match }

  it { should respond_to(:player) }
  it { should respond_to(:match) }
  it { should respond_to(:score) }
  it { should respond_to(:result) }

  describe "validations" do
    it { should be_valid }
    specify { expect_required_attribute(:player) }
    specify { expect_required_attribute(:match) }
  end
>>>>>>> 4b4494008ef6b2840b0b84d13f14c267a47c118c
end

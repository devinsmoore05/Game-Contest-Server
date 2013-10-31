require 'spec_helper'

describe Player do
<<<<<<< HEAD
  pending "add some examples to (or delete) #{__FILE__}"
=======
  let (:player) { FactoryGirl.create(:player) }
  subject { player }

  it { should respond_to(:user) }
  it { should respond_to(:contest) }
  it { should respond_to(:file_location) }
  it { should respond_to(:description) }
  it { should respond_to(:name) }
  it { should respond_to(:downloadable) }
  it { should respond_to(:playable) }
  it { should respond_to(:player_matches) }
  it { should respond_to(:matches) }

  describe "validations" do
    it { should be_valid }
    specify { expect_required_attribute(:user) }
    specify { expect_required_attribute(:contest) }
  end
>>>>>>> 4b4494008ef6b2840b0b84d13f14c267a47c118c
end

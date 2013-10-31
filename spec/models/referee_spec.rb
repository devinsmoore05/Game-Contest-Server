require 'spec_helper'

describe Referee do
<<<<<<< HEAD
  pending "add some examples to (or delete) #{__FILE__}"
=======
  let (:referee) { FactoryGirl.create(:referee) }
  subject { referee }

  it { should respond_to(:file_location) }
  it { should respond_to(:name) }
  it { should respond_to(:rules_url) }
  it { should respond_to(:players_per_game) }
  it { should respond_to(:contests) }
  it { should respond_to(:matches) }

  describe "validations" do
    it { should be_valid }
  end
>>>>>>> 4b4494008ef6b2840b0b84d13f14c267a47c118c
end

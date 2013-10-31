require 'spec_helper'

describe Contest do
<<<<<<< HEAD
  pending "add some examples to (or delete) #{__FILE__}"
=======
  let (:contest) { FactoryGirl.create(:contest) }
  subject { contest }

  it { should respond_to(:user) }
  it { should respond_to(:referee) }
  it { should respond_to(:description) }
  it { should respond_to(:deadline) }
  it { should respond_to(:start) }
  it { should respond_to(:name) }
  it { should respond_to(:contest_type) }
  it { should respond_to(:players) }
  it { should respond_to(:matches) }

  describe "validations" do
    it { should be_valid }
    specify { expect_required_attribute(:referee) }
    specify { expect_required_attribute(:user) }
  end
>>>>>>> 4b4494008ef6b2840b0b84d13f14c267a47c118c
end

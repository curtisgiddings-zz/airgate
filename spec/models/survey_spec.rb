require 'spec_helper'

describe Survey do
  before {@survey = Survey.new(name:"Test")}
  subject {@survey}

  it {should respond_to(:name)}
  it {should have_many(:questions)}


  describe "when name is not preset" do 
    before {@survey.name = " "}
    it {should_not be_valid}
  end
end

require 'spec_helper'

describe Question do
  before do
  	@question = Question.new(content:"Test content").tap do |u|
  		u.survey_id = 1
  	end
  end
  subject {@question}

  it {should respond_to(:content)}
  it {should belong_to(:survey)}


  describe "when content is not present" do 
    before {@question.content = " "}
    it {should_not be_valid}
  end
end

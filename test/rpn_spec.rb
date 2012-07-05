require 'rpn_converter'
describe RPNConverter do
  it 'turns "1 + 1" into "1 1 +"' do
    subject.infix_to_rpn("1 + 1").should == "1 1+"
  end

  it 'turns "1 + 23" into "1 23+"' do
    subject.infix_to_rpn("1 + 23").should == "1 23+"
  end

  it 'turns "(1 + 23)" into "1 23+"' do
    subject.infix_to_rpn("(1 + 23)").should == "1 23+"
  end

  it 'turns "1 + 2 + 3" into "1 2+3+"' do
    subject.infix_to_rpn("1 + 2 + 3").should == "1 2+3+"
  end

  it 'turns "1 - 2 + 3" into "1 2-3+"' do
    subject.infix_to_rpn("1 - 2 + 3").should == "1 2-3+"
  end

  it 'turns "1 - 2 * 3" into "1 2 3*-"' do
    subject.infix_to_rpn("1 - 2 * 3").should == "1 2 3*-"
  end

  it 'turns "1 * 2 / 3" into "1 2 3/*"' do
    subject.infix_to_rpn("1 * 2 / 3").should == "1 2*3/"
  end

  it 'turns "1 - 2 * (3 + 1)" into "1 2 3 1+*-"' do
    subject.infix_to_rpn("1 - 2 * (3 + 1)").should == "1 2 3 1+*-"
  end

  it 'turns "(1 - 2) * (3 + 1)" into "1 2-3 1+*"' do
    subject.infix_to_rpn("(1 - 2) * (3 + 1)").should == "1 2-3 1+*"
  end
end

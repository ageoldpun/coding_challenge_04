# analyze.rb

require 'rspec/autorun'

def delete_files
  system "rm -rf tmp && mkdir tmp"
end

describe 'analyze.rb' do
  it 'turns test_data_input.txt into a histogram' do
    delete_files

    system "bin/analyze < spec/fixtures/test_data_input.txt > tmp/output.txt"
    $?.should be_success
    File.read('tmp/output.txt').should == File.read('spec/fixtures/expected_output.txt')
  end
end


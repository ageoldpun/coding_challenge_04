# clean.rb

require 'rspec/autorun'

def delete_files
  system "rm -rf tmp && mkdir tmp"
end

describe 'clean.rb' do
  it 'parses test_data_input.txt into a csv' do
    delete_files

    system "bin/clean < spec/fixtures/test_data_input.txt > tmp/output.csv"
    $?.should be_success
    File.read('tmp/output.txt').should == File.read('spec/fixtures/expected_clean_output.txt')
  end
end

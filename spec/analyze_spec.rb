# analyze.rb

require 'rspec/autorun'

def create_files
  in_file = File.open 'spec/test_data_input.txt', 'w'
  in_file.puts 'Mr. Waylon Elisa Kozey-Kuhic III\t776.953.9374'
  in_file.puts 'Mr. Amie Dante Hamill-Eichmann DDS\t(727)733-2620 x7581'
  in_file.puts 'Ms. Brayan Hoppe\t(550)014-4130 x283'
  in_file.close
  expected_file = File.open 'spec/output.txt', 'w'
  expected_file.puts 'Mr. 2'
  expected_file.puts 'Ms. 1'
  expected_file.close
end

def delete_files
  FileUtils.rm %w( spec/test_data_input.txt spec/output.txt)
end

describe 'analyze.rb' do
  it 'turns test_data.txt into a histogram' do
    create_files
    `ruby lib/analyze.rb <spec/test_data_input.txt >spec/output.txt`
    File.read('spec/output.txt').should == File.read('spec/expected_output.txt')
    delete_files
  end
end

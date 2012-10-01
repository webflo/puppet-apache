require 'spec_helper'
require 'rspec-puppet'

describe "format_logfile" do

  it "should replace placeholders" do
    should run.with_params('%placeholder_access.log', {:placeholder => 'replace'}).and_return('replace_access.log')
  end
  it "should not replace escaped %" do
    should run.with_params('%%placeholder_access.log', {:placeholder => 'replace'}).and_return('%placeholder_access.log')
  end

end

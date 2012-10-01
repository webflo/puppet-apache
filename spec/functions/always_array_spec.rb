require 'spec_helper'

describe 'always_array' do

  describe "running from a manifest" do
    it "should accept a string" do
      should run.with_params('foo').and_return(['foo'])
    end

    it "should accept an array" do
      should run.with_params('foo','bar').and_return(['foo','bar'])
    end

    it "should accept a hash" do
      should run.with_params({'foo' => 'bar'}).and_return(['foo bar'])
    end
  end

  describe "running from a template" do
    let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

    it "should work when badly called without an array" do
      scope.function_inline_template('<%= scope.function_always_array({"foo" => "bar"}).join("---") %>') == 'foo---bar'
    end
    it "should work when properly called with an array" do
      scope.function_inline_template('<%= scope.function_always_array([{"foo" => "bar"}]).join("---") %>') == 'foo---bar'
    end

  end

end

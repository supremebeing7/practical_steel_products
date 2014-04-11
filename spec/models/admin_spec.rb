require 'spec_helper'

describe Admin do
  before(:each) do
    FactoryGirl.create(:admin)
  end

  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
  it { should validate_presence_of :password_digest }
end

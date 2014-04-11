require 'spec_helper'

describe Admin do
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }
end

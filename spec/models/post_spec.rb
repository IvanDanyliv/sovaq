require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @post1 = create(:post)
  end

  it 'is valid with valid attributes' do
    expect(@post1).to be_valid
  end
end

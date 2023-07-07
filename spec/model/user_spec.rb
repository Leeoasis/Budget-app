require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:records).with_foreign_key('author_id') }
end

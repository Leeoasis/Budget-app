require 'rails_helper'

RSpec.describe Record, type: :model do
  it { should have_and_belong_to_many(:categories) }
  it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:author_id) }
end

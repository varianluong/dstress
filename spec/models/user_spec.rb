require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should not save if email already exists' do
  	user1 = User.create(handle:"bobz", first_name:'Bob', last_name:'Bobby', email:'bob@bobby.com', password:'password', password_confirmation:'password', location: 94539)
  	user2 = User.create(handle:'bobyo', first_name:'Bobyo', last_name:'Bobzo', email:'bob@bobby.com', password:'password', password_confirmation:'password', location: 94539)
  	expect(user2.errors[:email]).not_to be_empty
  end

  it 'should not save if any field is blank' do
  	user = User.create()
  	expect(user.errors).not_to be_empty
  end
end

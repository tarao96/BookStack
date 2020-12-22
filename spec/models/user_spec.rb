require 'rails_helper'

RSpec.describe User, type: :model do  #何のテストをするのか、対象を書く
   it 'is not be valid without name' do　#期待する動作説明を書く
    user = User.new(name: '')
    expect(user).not_to be_valid  #動作をテストする部分
   end
end
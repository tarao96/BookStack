require 'rails_helper'

RSpec.describe User, type: :model do 
   
   let(:user) { User.new(
       name: "Example User",
       email: "user@example.com",
       password: "password"
       ) }
       
    describe "User" do
        it 'should be valid' do
            expect(user).to be_valid
        end
    end
    
    describe "name" do
        it "gives presence" do
            user.name = ""
            expect(user).to be_invalid
        end
        
      context '21 characters' do
          it 'is too long' do
              user.name = "a" * 21
              expect(user).to be_invalid
          end
      end
      
      context '20 characters' do
          it 'is not too long' do
              user.name = "a" * 20
              expect(user).to be_valid
          end
      end
      
      context '2 characters' do
          it 'is too short' do
              user.name = "a" * 2
              expect(user).to be_invalid
          end
      end
      
      context '3 characters' do
          it 'is not too short' do
              user.name = "a" * 3
              expect(user).to be_valid
          end
      end
    end
    
    describe "email" do
        it 'gives presence' do
            user.email = ""
            expect(user).to be_invalid
        end
    end
end
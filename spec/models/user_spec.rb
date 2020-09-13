require 'rails_helper'

   #空だと登録できないこと
   describe User do
    it "is invalid without a name" do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    it "is invalid without a profile" do
      user = User.new(profile: nil)
      user.valid?
      expect(user.errors[:profile]).to include("can't be blank")
    end
    it "is invalid without an email" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "is invalid without an image" do
      user = User.new(image: nil)
      user.valid?
      expect(user.errors[:image]).to include("can't be blank")
    end
    it "is invalid without a password" do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    #名前が11文字以上だと登録されない
    it "is invalid with a name that has more than 11 characters " do
      user = User.new(name: "a"*11)
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 10 characters)")
    end
    #説明文が201文字以上だと登録されない
    it "is invalid with a profile that has more than 200 characters " do
      user = User.new(profile: "a"*201)
      user.valid?
      expect(user.errors[:profile]).to include("is too long (maximum is 200 characters)")
    end
  end


  #必須項目全て入力されていれば登録ができること
  describe User do
    describe '#create' do
      it "is valid with a name, profile, image, email,password" do
        user = User.new
        expect(user).to be_invalid
      end
    end
  end
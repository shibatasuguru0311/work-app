require 'rails_helper'
    #空だと登録できないこと
  describe Work do
    it "is invalid without a name" do
      work = Work.new(name: nil)
      work.valid?
      expect(work.errors[:name]).to include("can't be blank")
    end
    it "is invalid without an introduction" do
      work = Work.new(introduction: nil)
      work.valid?
      expect(work.errors[:introduction]).to include("can't be blank")
    end
    it "is invalid without an address" do
      work = Work.new(address: nil)
      work.valid?
      expect(work.errors[:address]).to include("can't be blank")
    end
    it "is invalid without a photo" do
      work = Work.new(photo: nil)
      work.valid?
      expect(work.errors[:photo]).to include("can't be blank")
    end

    #名前が31文字以上だと登録されない
    it "is invalid with a name that has more than 31 characters " do
      work = Work.new(name: "a"*31)
      work.valid?
      expect(work.errors[:name]).to include("is too long (maximum is 30 characters)")
    end
    #説明文が1001文字以上だと登録されない
    it "is invalid with a introduction that has more than 200 characters " do
      work = Work.new(introduction: "a"*201)
      work.valid?
      expect(work.errors[:introduction]).to include("is too long (maximum is 200 characters)")
    end
  end


  #必須項目全て入力されていれば登録ができること
  describe Work do
    describe '#create' do
      it "is valid with a name, introduction, address, photo" do
        work = Work.new(url:nil)
        expect(work).to be_invalid
      end
    end
  end
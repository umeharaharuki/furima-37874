require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
  @user.password_confirmation = '1234567'
  @user.valid?
  expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
  another_user = FactoryBot.build(:user)
  another_user.email = @user.email
  another_user.valid?
  expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
  @user.valid?
  expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
  @user.password_confirmation = '00000'
  @user.valid?
  expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
  @user.password_confirmation = @user.password
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'first_nameが半角では登録できない' do
      @user.first_name = 'tarou'
  @user.valid?
  expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'last_nameが半角では登録できない' do
      @user.last_name = 'tanaka'
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'first_name_kanaがひらがなと漢字では登録できない' do
      @user.first_name_kana = 'ひらがな漢字'
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'last_name_kanaがひらがなと漢字では登録できない' do
      @user.last_name_kana = 'ひらがな漢字'
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it 'passwordが全角では登録できない' do
      @user.password = '１あ１ア１あ'
  @user.password_confirmation = '１あ１ア１あ'
  @user.valid?
  expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが英字だけでは登録できない' do
      @user.password = 'aaaaaa'
  @user.password_confirmation = 'aaaaaa'
  @user.valid?
  expect(@user.errors.full_messages).to include('Password is invalid')
  end
  it 'passwordが数字だけでは登録できない' do
    @user.password = '111111'
@user.password_confirmation = '111111'
@user.valid?
expect(@user.errors.full_messages).to include('Password is invalid')
end
 end
end
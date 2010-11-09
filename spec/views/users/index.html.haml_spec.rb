require 'spec_helper'

describe "users/index.html.erb" do

  before do
    @user1 ||= mock_user
    @user2 ||= mock_user
    assign(:users, [@user1, @user2])
    render
  end

  it 'should have h1 with description' do
    rendered.should have_selector('h1', :content => 'Listing users')
  end

  it 'should have column header Nickname' do
    rendered.should have_selector('table > tr > th', :content => 'Nickname')
  end

  it 'should have column header Name' do
    rendered.should have_selector('table > tr > th', :content => 'Name')
  end

  it 'should have column header Surname' do
    rendered.should have_selector('table > tr > th', :content => 'Surname')
  end
 
  it 'should have column header Email' do
    rendered.should have_selector('table > tr > th', :content => 'Email')
  end
 
  it 'should have column header Description' do
    rendered.should have_selector('table > tr > th', :content => 'Description')
  end

  it 'should have first user nickname' do
    rendered.should have_selector('table > tr > td', :content => @user1.nickname)
  end

  it 'should have first user name' do
    rendered.should have_selector('table > tr > td', :content => @user1.name)
  end

  it 'should have first user surname' do
    rendered.should have_selector('table > tr > td', :content => @user1.surname)
  end

  it 'should have first user email' do
    rendered.should have_selector('table > tr > td', :content => @user1.email)
  end

  it 'should have first user description' do
    rendered.should have_selector('table > tr > td', :content => @user1.description)
  end

  it 'should have second user nickname' do
    rendered.should have_selector('table > tr > td', :content => @user2.nickname)
  end

  it 'should have second user name' do
    rendered.should have_selector('table > tr > td', :content => @user2.name)
  end

  it 'should have second user surname' do
    rendered.should have_selector('table > tr > td', :content => @user2.surname)
  end

  it 'should have second user email' do
    rendered.should have_selector('table > tr > td', :content => @user2.email)
  end

  it 'should have second user description' do
    rendered.should have_selector('table > tr > td', :content => @user2.description)
  end

  private

    def mock_user
      @mock_user_num ||= 0
      @mock_user_num += 1
      mock_model(User,
        :nickname => "nickname#{@mock_user_num}",
        :name => "name#{@mock_user_num}",
        :surname => "surname#{@mock_user_num}",
        :email => "email#{@mock_user_num}",
        :description => "description#{@mock_user_num}"
      )
    end

end

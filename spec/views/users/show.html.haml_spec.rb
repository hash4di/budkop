require 'spec_helper'

describe "users/show.html.erb" do

  before do
    @user = mock_model(User,
      :nickname => "MyString",
      :name => "MyString",
      :surname => "MyString",
      :email => "MyString",
      :description => "MyString"
    )
    assigns[:user]
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("MyString")
  end

end

require 'spec_helper'

describe "users/new.html.erb" do

  before do
    @user = mock_model(User,
      :new_record? => true,
      :nickname => "MyString",
      :name => "MyString",
      :surname => "MyString",
      :email => "MyString",
      :description => "MyString"
    )
    assigns[:user] = @user
  end

  it "renders new user form" do
    render
    rendered.should have_selector("form", :action => users_path, :method => "post") do |form|
      form.should have_selector("input#user_ nickname", :name => "user[ nickname]")
      form.should have_selector("input#user_name", :name => "user[name]")
      form.should have_selector("input#user_surname", :name => "user[surname]")
      form.should have_selector("input#user_email", :name => "user[email]")
      form.should have_selector("input#user_description", :name => "user[description]")
    end
  end

end

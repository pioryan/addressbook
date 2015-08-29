require "rails_helper"

describe User do

  #full_name = first_name last_name

  describe "associations" do
    it { should have_many(:authentications) }
  end

  describe ".create" do
    it "should create a new user" do
      expect {
        User.create(email: "pio@sample.com", password: "qwerty123", first_name: "Pio Ryan", last_name: "Lumongsod")
      }.to change(User, :count).by(1)

    end
  end

  describe "#full_name" do
    it "should work" do
      user = User.create(email: "pio@sample.com", password: "qwerty123", first_name: "Pio Ryan", last_name: "Lumongsod")
      expect(user.full_name).to eq("Pio Ryan Lumongsod")
    end
  end

end
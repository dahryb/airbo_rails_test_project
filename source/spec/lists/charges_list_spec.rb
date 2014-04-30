require "spec_helper"
describe "Charges lists", :type => :feature do
  describe "lists presence" do
    before :each do
      visit "/charges"
    end

    it "should have 3 lists total" do
      all("ul").count.should eq 3
    end

    it "should have succeed list" do
      all("ul#succeed").count.should eq 1
    end

    it "should have disputed list" do
      all("ul#disputed").count.should eq 1
    end

    it "should have failed list" do
      all("ul#failed").count.should eq 1
    end
  end

  describe "properly charges count in each column" do

    before :each do
      visit "/charges"
    end

    it "succeed list should have 10 items" do
      all("ul#succeed>li.item").count.should eq 10
    end

    it "failed should have 5 items" do
      all("ul#failed>li.item").count.should eq 5
    end

    it "disputed should have 5 items" do
      all("ul#disputed>li.item").count.should eq 5
    end
    
  end
end
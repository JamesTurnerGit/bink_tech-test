require "spec_helper"
feature "do a thing" do

  let(:noun){"noun"}
  let(:colour){"colour"}
  let(:item1) {"http://item1"}
  let(:item2) {"http://item2"}
  let(:item3) {"http://item3"}
  let(:item4) {"http://item4"}
  let(:item5) {"http://item5"}
  let(:links) {[item1,item2,item3,item4,item5]}
  let(:response_time) {"response_time"}
  let(:date) {"date"}
  let(:time) {"time"}
  let(:response) {Response.new(noun, colour, links, response_time, date, time)}

  before(:each){
    allow(GoogleApi).to receive(:search).and_return(response)
  }

  scenario "visits default route" do
    visit("")
    expect(page).to have_content("COLOURS AND NOUNS PRO")
    expect(page).to have_button("red")
    expect(page).to have_button("pink")
    expect(page).to have_button("yellow")
    expect(page).to have_button("green")
    expect(page).to have_button("blue")
    expect(page).to have_button("purple")
    expect(page).not_to have_content("results for")
  end

  scenario "clicks rerun search" do
    visit("")
    click_on("red")
    click_on("red")
    click_on("rerun search")
    expect(page).to have_content("results for \"colour noun\"")
  end

  scenario "clicks enough times to see history appear" do
    visit("")
    click_on("red")
    click_on("red")
    expect(page).to have_content("response_time")
    expect(page).to have_content("date")
    expect(page).to have_content("time")
    expect(page).to have_button("rerun search")
  end

  scenario "clicks red button" do
    visit("")
    click_on("red")
    expect(GoogleApi).to have_received(:search).with(anything, "red")
  end

  scenario "clicks pink button" do
    visit("")
    click_on("pink")
    expect(GoogleApi).to have_received(:search).with(anything, "pink")
  end

  scenario "clicks orange button" do
    visit("")
    click_on("orange")
    expect(GoogleApi).to have_received(:search).with(anything, "orange")
  end

  scenario "clicks yellow button" do
    visit("")
    click_on("yellow")
    expect(GoogleApi).to have_received(:search).with(anything, "yellow")
  end

  scenario "clicks green button" do
    visit("")
    click_on("green")
    expect(GoogleApi).to have_received(:search).with(anything, "green")
  end

  scenario "clicks blue button" do
    visit("")
    click_on("blue")
    expect(GoogleApi).to have_received(:search).with(anything, "blue")
  end

  scenario "clicks purple button" do
    visit("")
    click_on("purple")
    expect(GoogleApi).to have_received(:search).with(anything, "purple")
  end

  scenario "clicks any button and sees results" do
    visit("")
    click_on("red")
    expect(page).to have_content("results for \"colour noun\"")
  end


end

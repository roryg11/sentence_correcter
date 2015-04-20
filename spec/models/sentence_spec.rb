require 'rails_helper'

RSpec.describe Sentence, type: :model do
  it "takes in a string" do
    sentence = Sentence.create(
      input_text: "Assumenda Schlitz voluptate aesthetic chia, bitters blog nihil master cleanse put a bird on it whatever.Sapiente meggings freegan quinoa, vinyl direct trade tattooed lomo.Readymade vero McSweeney's nostrud Helvetica freegan.Tilde irony dolore gentrify, salvia raw denim hashtag drinking vinegar veniam Shoreditch.Exercitation officia ex Portland velit, cray chambray.Plaid cold-pressed four dollar toast hashtag aute.Squid odio yr, gentrify excepteur nulla voluptate Shoreditch cliche."
    )
    expect(sentence.input_text.class).to eq(String)
  end

  it 'turns the input_text into an array' do
    sentence = Sentence.create(
      input_text: "Assumenda Schlitz voluptate aesthetic chia, bitters blog nihil master cleanse put a bird on it whatever.Sapiente meggings freegan quinoa, vinyl direct trade tattooed lomo.Readymade vero McSweeney's nostrud Helvetica freegan.Tilde irony dolore gentrify, salvia raw denim hashtag drinking vinegar veniam Shoreditch.Exercitation officia ex Portland velit, cray chambray.Plaid cold-pressed four dollar toast hashtag aute.Squid odio yr, gentrify excepteur nulla voluptate Shoreditch cliche."
    )

    expect(sentence.to_an_array.class).to eq(Array)
  end

  it 'identifies sentences without leading spaces and adds a space' do
    sentence = Sentence.create(
      input_text: "Assumenda Schlitz voluptate aesthetic chia, bitters blog nihil master cleanse put a bird on it whatever.Sapiente meggings freegan quinoa, vinyl direct trade tattooed lomo.Readymade vero McSweeney's nostrud Helvetica freegan.Tilde irony dolore gentrify, salvia raw denim hashtag drinking vinegar veniam Shoreditch.Exercitation officia ex Portland velit, cray chambray.Plaid cold-pressed four dollar toast hashtag aute.Squid odio yr, gentrify excepteur nulla voluptate Shoreditch cliche."
    )

    expected = "Assumenda Schlitz voluptate aesthetic chia, bitters blog nihil master cleanse put a bird on it whatever. Sapiente meggings freegan quinoa, vinyl direct trade tattooed lomo. Readymade vero McSweeney's nostrud Helvetica freegan. Tilde irony dolore gentrify, salvia raw denim hashtag drinking vinegar veniam Shoreditch. Exercitation officia ex Portland velit, cray chambray. Plaid cold-pressed four dollar toast hashtag aute. Squid odio yr, gentrify excepteur nulla voluptate Shoreditch cliche."
    expect(sentence.correct_leading_space).to eq(expected)
  end

  it 'subtracts space when there is more than one space' do
    sentence = Sentence.create(
      input_text: "Assumenda Schlitz voluptate aesthetic chia, bitters blog nihil master cleanse put a bird on it whatever.  Sapiente meggings freegan quinoa, vinyl direct trade tattooed lomo.Readymade vero McSweeney's nostrud Helvetica freegan.  Tilde irony dolore gentrify, salvia raw denim hashtag drinking vinegar veniam Shoreditch.   Exercitation officia ex Portland velit, cray chambray.    Plaid cold-pressed four dollar toast hashtag aute.Squid odio yr, gentrify excepteur nulla voluptate Shoreditch cliche."
    )

    expected = "Assumenda Schlitz voluptate aesthetic chia, bitters blog nihil master cleanse put a bird on it whatever. Sapiente meggings freegan quinoa, vinyl direct trade tattooed lomo. Readymade vero McSweeney's nostrud Helvetica freegan. Tilde irony dolore gentrify, salvia raw denim hashtag drinking vinegar veniam Shoreditch. Exercitation officia ex Portland velit, cray chambray. Plaid cold-pressed four dollar toast hashtag aute. Squid odio yr, gentrify excepteur nulla voluptate Shoreditch cliche."
    expect(sentence.correct_leading_space).to eq(expected)
  end

  it 'compares the old string and new string and identifies deletions' do
    sentence = Sentence.create(
      input_text: "Assumenda Schlitz voluptate aesthetic chia, bitters blog nihil master cleanse put a bird on it whatever.Sapiente meggings freegan quinoa, vinyl direct trade tattooed lomo.Readymade vero McSweeney's nostrud Helvetica freegan.  Tilde irony dolore gentrify, salvia raw denim hashtag drinking vinegar veniam Shoreditch.   Exercitation officia ex Portland velit, cray chambray.Plaid cold-pressed four dollar toast hashtag aute.Squid odio yr, gentrify excepteur nulla voluptate Shoreditch cliche."
    )
    new_sentence = "Assumenda Schlitz voluptate aesthetic chia, bitters blog nihil master cleanse put a bird on it whatever. Sapiente meggings freegan quinoa, vinyl direct trade tattooed lomo. Readymade vero McSweeney's nostrud Helvetica freegan. Tilde irony dolore gentrify, salvia raw denim hashtag drinking vinegar veniam Shoreditch. Exercitation officia ex Portland velit, cray chambray. Plaid cold-pressed four dollar toast hashtag aute. Squid odio yr, gentrify excepteur nulla voluptate Shoreditch cliche."
    expect(sentence.num_deletions).to eq(3)
  end
end

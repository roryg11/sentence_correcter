class Sentence < ActiveRecord::Base
  def to_an_array
    input_text_array = input_text.split(".").map(&:strip)
  end

  def correct_leading_space
    new_string = input_text.split(".").map(&:strip).join(". ")
    if input_text[-1] == "."
      new_string = new_string + "." #accounts for splitting the last period
    end
  end

  def new_string_length
    correct_leading_space.length
  end
end

class SentencesController < ApplicationController
  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.create(sentence_params)
    if @sentence.save
      @sentence.corrected_text = @sentence.correct_leading_space
      if @sentence.save
        flash[:notice] = "correcting your input"
        render json: @sentence
      end
    else
      flash[:alert] = "there was an error with your input"
    end
  end

  private
  def sentence_params
    params.require(:sentence).permit(:input_text)
  end
end

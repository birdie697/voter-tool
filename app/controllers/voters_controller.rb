class VotersController < ApplicationController

  def new
    @voter = Voter.new
  end

end

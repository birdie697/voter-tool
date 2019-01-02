require 'geokit'
class VotersController < ApplicationController
  include Geokit::Geocoders

  def index
    @voters = Voter.all
  end

  def new
    @voter = Voter.new
  end

  def create

    first_name = params[:voter][:first_name]
    last_name = params[:voter][:last_name]
    street = params[:voter][:street]
    city = params[:voter][:city]
    state = params[:voter][:state]
    vote = params[:voter][:vote]

    address = "#{street}, #{city}, #{state}"

    location = GoogleGeocoder.geocode(address)
    lat = location.lat
    lng = location.lng

    @voter = Voter.new

    @voter.first_name = first_name
    @voter.last_name = last_name
    @voter.street = street
    @voter.city = city
    @voter.state = state
    @voter.lat = lat
    @voter.lng = lng
    @voter.vote = vote

    # binding.pry

    if @voter.save
      redirect_to voters_path
    else
      render :new
    end

  end

  def voter_parms
    params.require(:voter).permit(:first_name,
                                  :last_name,
                                  :street,
                                  :city,
                                  :state,
                                  :lat,
                                  :lng,
                                  :vote)
  end

end

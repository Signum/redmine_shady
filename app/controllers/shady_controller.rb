class ShadyController < ApplicationController
  before_action :authorize_global, only: [:create]

  def create
    if pref[:shady].nil?
      pref[:shady] = true
      pref.save!
    end

    redirect_back(fallback_location: home_path)
  end

  def destroy
    if pref[:shady]
      pref.others.delete(:shady)
      pref.save!
    end

    redirect_back(fallback_location: home_path)
  end

  private

  def pref
    User.current.pref
  end
end

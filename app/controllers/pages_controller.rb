class PagesController < ApplicationController
  layout false, only: [:landing]

  def landing
  end

  def splash
  end
end

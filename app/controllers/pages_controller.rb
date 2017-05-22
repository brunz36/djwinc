class PagesController < ApplicationController
  layout false, only: [:landing]
  skip_before_action :authorize

  def landing
  end

  def splash
  end

  def education
  end
end

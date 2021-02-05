class StaticPagesController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  
  def home
  end

end

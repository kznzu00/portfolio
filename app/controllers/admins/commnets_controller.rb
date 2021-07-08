class Admins::CommnetsController < ApplicationController
  before_action :authenticate_admin!
end

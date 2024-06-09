# app/controllers/api/v1/base_controller.rb
class Api::V1::BaseController < ApplicationController
    include CurrentUserConcern
end
  
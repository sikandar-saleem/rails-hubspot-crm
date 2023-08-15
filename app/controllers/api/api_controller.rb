# frozen_string_literal: true

module Api
  # ApiContoller
  class ApiController < ApplicationController
    def render_success_response(json_response, message = 'Fetched successfully.', response_code = 200)
      render json: { data: json_response, status_code: response_code, message: }
    end

    def render_error_response(json_response, response_code = :unprocessable_entity, errors = nil)
      if errors.present?
        errors = errors.full_messages if errors.is_a?(ActiveModel::Errors)
        json_response = json_response.merge(errors:)
      end

      render json: json_response.merge(success: false), status: response_code
    end

    def render_not_found(errors = ['Requested resource not found.'])
      errors = [errors] if errors.is_a? String
      render_error_response({}, :not_found, errors)
    end
  end
end

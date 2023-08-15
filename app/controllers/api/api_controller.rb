# frozen_string_literal: true

module Api
  # ApiController
  class ApiController < ApplicationController
    def render_success_response(json_response, message = 'Success.', response_code = :ok)
      render json: { data: json_response, status_code: response_code, message: }
    end

    def render_error_response(errors = ['Something went wrong.'], status_code = :unprocessable_entity)
      error_messages = parse_errors(errors)
      render json: { errors: error_messages, status_code: }
    end

    def render_not_found(errors = ['Requested resource not found.'])
      error_messages = parse_errors(errors)
      render_error_response(error_messages, :not_found)
    end

    private

    def parse_errors(errors)
      return [] unless errors.present??

      if errors.is_a?(ActiveModel::Errors)
        errors.full_messages
      elsif errors.is_a?(String)
        [errors]
      else
        errors
      end
    end
  end
end

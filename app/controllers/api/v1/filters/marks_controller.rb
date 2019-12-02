# frozen_string_literal: true

class Api::V1::Filters::MarksController < ApplicationController
  def index
    options = Mark.all.map { |i| MarkSerializer.new(i) }

    render json: { mark: { type: 'SELECT', text: 'Марка', options: options } }
  end
end

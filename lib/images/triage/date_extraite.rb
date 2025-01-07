# frozen_string_literal: true

require "images/helpers/directory_helpers"

require "images/classification/classification"

module Triage
  # Fichier
  class DateExtraite
    attr_reader :extension

    def initialize(path)
      @date_extraite = date_extraite
    end
  end
end

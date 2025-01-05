# frozen_string_literal: true

# Triage
class Triage
  def initialize(exclusion)
    @exclusion = exclusion
  end

  def defini(chemin)
    arborescence = chemin.split(File::SEPARATOR)

    chemin_filtre = arborescence.reject do |niveau|
      @exclusion.include?(niveau)
    end

    chemin_filtre.reject(&:empty?)
                 .join(";")
  end
end

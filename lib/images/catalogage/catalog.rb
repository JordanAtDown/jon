# frozen_string_literal: true

module Catalogage
  # Cataloger
  class Catalog
    def initialize(analyse, nom_attributeur, application, verificateur)
      @analyse = analyse
      @nom_attributeur = nom_attributeur
      @application = application
      @verificateur = verificateur
      @log = Logging.logger["Cataloguer"]
    end

    def process(dossier, apply, destination)
      @analyse.analyser(dossier)
      @nom_attributeur.attribut(@analyse.fichiers_analyses)
      @verificateur.index(@analyse.fichiers_analyses, destination)
      @log.info "Fichiers en conflits : #{@verificateur.conflit.keys}"
      if apply && !@verificateur.conflit.size.positive?
        @application.applique(@analyse.fichiers_analyses, destination)
      end
    end
  end
end

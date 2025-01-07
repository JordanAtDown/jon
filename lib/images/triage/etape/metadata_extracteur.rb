# frozen_string_literal: true

module Triage
  module Etape
    # Analyse
    class MetadataExtracteur
      attr_reader :fichiers_analyses

      def initialize
        @log = Logging.logger["Date Extraction"]
      end

      def date(dossier)
        @log.debug "Parcours du dossier '#{dossier}'"

        Dir.each_child(dossier) do |nom_fichier|
          fichier = "#{dossier}/#{nom_fichier}"

          next unless File.file?(fichier)
          # Date extraite
          # Extraction de la date par le nom du fichier -> Utilise un dictionnaire
          # Extraction de la date par le nom du dossier -> Utilise un dictionnaire
          # Extraction de la date par les metadata EXIF

          # Format
          # Extraction de l'extension du fichier

          # Tag
          # Extraire l'arborescence du fichier
          # Extraire le nom du fichier quand il contient du texte
        end
      end
    end
  end
end

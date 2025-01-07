# frozen_string_literal: true

module Triage
  module Etape
    # Serializer
    class MetadataSerializer
      attr_reader :fichiers_analyses

      def initialize; end

      def serializer(nom)
        # Doit serializer les metadata dans un fichier json au nom du fichier

        # # Écrire dans un fichier nommé person.json
        # File.write("person.json", person.to_json)
      end
    end
  end
end

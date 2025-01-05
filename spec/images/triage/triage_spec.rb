# frozen_string_literal: true

require "rspec"
require "rspec-parameterized"
require "images/triage/triage"

RSpec.describe Triage do
  describe "doit pouvoir tester" do
    before do
      @dossier_tmp = FileUtils.makedirs "#{FileHelpers::TMP}rspec_analyse"
    end

    where(:case_name, :fichiers, :attendu) do
      [
        ["test 01'", { "ANNEE 2011/MES SORTIES EN MONTAGNES" => ["2021_01_10-15_10_52.jpeg"] },
         "ANNEE 2011;MES SORTIES EN MONTAGNES"]
      ]
    end
    with_them do
      it "en ajoutant une numerotation" do
        FileHelpers.build_fichiers(fichiers, "#{@dossier_tmp[0]}/")

        extract = Triage.new.extraction_du("nom")

        expect(extract).to eq attendu
      end
    end

    after do
      FileUtils.rm_rf(@dossier_tmp[0])
    end
  end
end

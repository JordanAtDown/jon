# frozen_string_literal: true

module RegexHelpers
  EXTENSIONS_EXCLUS = /\.(?!(ini|log|1|db-shm|db-wal|db)$)([^.]+$)/.freeze
  EXTENSIONS_SPECIFIQUE = /\.(?!(tmp|wmv|raw|thumbnail|mta|mpg|mix|3gp|asf|AVI|MOV|MPG|asx|mcf|bmp)$)([^.]+$)/.freeze
  EXTENSIONS_EXCLUS_TRIAGE = /\.(?!(ini|log|1|db-shm|db-wal|db|téléchargement|zip|xml|xls|txt|pub@SynoEAStream|psd|ppt|pps|pub|pdf|odt|odp|odt|html|htm|1|css|doc|docx|gif|gpx|lnk|gpx@SynoEAStream|db@SynoEAStreamlog|bmp@SynoEAStream|dat|URL|mht|md|THM|bas)$)([^.]+$)/.freeze
end

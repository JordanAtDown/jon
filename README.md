# Jon

Jon est une library permettant d'outiller un workflow de gestion d'une photothéque. Actuellement la library défini deux workflow :

* Restore : Permet de restaurer un dossier, renommage et appliquer les metadata de date manquante
* Catalog : Permet de cataloguer des photos en les renommant, définissant dans un dossier avec l'arborescence année/mois/extension (ex: 2021/01/JPG). Pour ensuite les copier vers un dossier de destination

## Usage

La restauration est un process parcourant tout les fichiers d'un dossier source
``` ruby
require "images/restauration/etape/analyse"
require "images/restauration/etape/application"
require "images/restauration/etape/traitement_dossier_extirpable"
require "images/restauration/etape/traitement_dossier_non_extirpable"
require "images/restauration/restore"

path_dossier = "/vault"
apply = true

Restauration::Restore.new(
        Restauration::Etape::Analyse.new(ExtracteurParDate.new),
        Restauration::Etape::TraitementDossierExtirpable.new(ExtracteurParDate.new),
        Restauration::Etape::TraitementDossierNonExtirpable.new,
        Restauration::Etape::Application.new(MiniExiftoolManipulateur.new)
    ).process(path_dossier, apply)
    
```
Le catalogage est un processus parcourants les fichiers d'un dossier source
``` ruby
require "images/catalogage/etape/analyse"
require "images/catalogage/etape/application"
require "images/catalogage/etape/nom_attribuer"
require "images/catalogage/etape/verificateur"
require "images/catalogage/catalog"

path_dossier = "/camera"
apply = true
destination = "/vault"

Catalogage::Catalog.new(
        Catalogage::Etape::Analyse.new(ExtracteurParDate.new, MiniExiftoolManipulateur.new),
        Catalogage::Etape::NomAttribuer.new,
        Catalogage::Etape::Application.new(MiniExiftoolManipulateur.new),
        Catalogage::Etape::Verificateur.new
    ).process(path_dossier, apply, destination)
    
```

L'extracteur permet d'extraire une date du nom de fichier [voir](lib/images/extraction/extracteur_par_date.rb) différent format de fichier son pris en compte 

``` ruby
require "images/extraction/extracteur_par_date"

extracteur = ExtracteurParDate.new

nom = "20151231_155723_011"

extracteur.extraction_du(nom) # DateTime.new(2015, 12, 31, 15, 57, 23) 
extracteur.extirpabilite(nom) # true
```

ExifManipulateur permet de manipuler les metadatas des fichiers

``` ruby
require "images/exif/mini_exiftool_manipulateur"

exif_manipulateur = MiniExiftoolManipulateur.new

fichier = File.new("./photo_2021_12_25-15_52_17.jpg")
datetimeoriginal = DateTime.new(2020, 2, 1, 1, 1, 1)

exif_manipulateur.set_datetimeoriginal(fichier, datetimeoriginal) # date_time_original : 2021:12:25 15:52:17
exif_manipulateur.get_datetimeoriginal(fichier) # DateTime.new(2021, 12, 25, 15, 52, 17)
exif_manipulateur.datetimeoriginal?(fichier) # true

```

## Installation

Exécuter :

    $ bundle install

## Développement

Aprés avoir récupéré le repository, exécuter `bin/setup` pour installer les dépendances. Puis lancer `rake spec` pour exécuter les tests automatisés.

Pour installer cette gem sur la machine, exécuter `bundle exec rake install`. 
Pour release une nouvelle version, mettre à jour le numéro de version dans `version.rb`, puis exécuter `bundle exec rake release` ce qui crée un nouveau tag git pour la version, push les commit et crée un tag et push le `.gem` vers [rubygems.org](https://rubygems.org).

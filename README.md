# Jon

## Installation

Exécuter :

    $ bundle install

## Développement

Aprés avoir récupéré le repository, exécuter `bin/setup` pour installer les dépendances. Puis lancer `rake spec` pour exécuter les tests automatisés.

Pour installer cette gem sur la machine, exécuter `bundle exec rake install`. 
Pour release une nouvelle version, mettre à jour le numéro de version dans `version.rb`, puis exécuter `bundle exec rake release` ce qui crée un nouveau tag git pour la version, push les commit et crée un tag et push le `.gem` vers [rubygems.org](https://rubygems.org).

# The Gossip Project - Views v1.0
_l'app putasse_

<div style="text-align:center" align="center">
  <img alt="Gossip" src="app/assets/images/the_gossip_project.png" style="width:285px;height:285px">
</div>

## Application

Réseau social de partage et commentaires de potins, créée dans le cadre de The Hacking Project

## Installation

- Pre-Installer bundle et gem dépendencies.
  ```
  bundle install
  bundle update
  ```
- Configuration de base de donnée.
  
  On utilise le postgres comme le base de donnée. Pour exécuter ce projet avec votre potgres en local, vous devez avoir ou créer un utilisateur pour le postgres.

  >username: postgres
  >password: postgres

  Si vous ne voulez pas configurer cet utilisateur sur votre ordinateur. Il faudrait juste remplacer votre utilisateur dans le fichier `config/database.yml`

  ```yml
  development:
  <<: *default
  database: bairbnb_development
  host: localhost
  username: <<your-user-name>>
  password: <<your-password>>
  ```

- Exécuter le base de donnée sur votre ordinateur
  
  ```bash
  rails db:create #ou rails db:create:all #ou rake db:create:all
  rails db:migrate
  ```


## Contributeurs

- [:fire: Stanislas BASQUIN](https://github.com/StanislasBASQUIN)
- [:v: Tien Duy NGUYEN](https://github.com/tienduy-nguyen)
- [:v: Hugo Péran Séjourné](https://github.com/HugoPeranSejourne)
- [:seedling: Mathieu JOLY](https://github.com/mathieu-superpose)
- [:seedling: Vivien Ploix](https://github.com/Vivien-Ploix)
- [:fire: Chérif BA](https://github.com/barifche)


# THP Gossip Project
This is my completed gossip project at The Hacking Project


# The Gossip Project - Views v4.0
_l'app putasse_

<div style="text-align:center" align="center">
  <img alt="Gossip" src="app/assets/images/the_gossip_project.png" style="width:285px;height:285px">
</div>

## Application

Social network for sharing and commenting on gossip, created as part of The Hacking Project

## Installation

- Pre-install bundle et gem dependencies.
  ```
  bundle install
  bundle update
  ```
- Configuration de data base.
  
  We use the postgres as the database. To run this project with your local postgres, you need have or create an user for the postgres database.

  >username: postgres
  >password: postgres

  If you don't want to configure this user on your computer. You just need to replace your username/password in the `config / database.yml` file

  ```yml
  development:
  <<: *default
  database: bairbnb_development
  host: localhost
  username: <<your-user-name>>
  password: <<your-password>>
  ```

- Run the database on your computer
  
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


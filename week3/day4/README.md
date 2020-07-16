# Art of the scrapping

- Dark trader
  
  Crawler data from 
  
  [coinmarketcap.com](https://coinmarketcap.com/all/views/all/)
  
  Stock the key of each cryptocurrency and their price to an array of hash

  ```ruby
  a = [
    { "BTC" => 5245.12 },
    { "ETH" => 217.34 }, 
    etc
  ]
  ```

- Mairie christmas
  
  Get all emails of all villes Val-d'Oise from 
  
  [List all city Val d'Oise](http://annuaire-des-mairies.com/)

  ```ruby
    a = [
    { "ville_1" => "email_1" },
    { "ville_2" => "email_2" }, 
    etc
  ]
  ```

- Cher député
  
  Crawl list infomation of deputy in France

  [List of deputies in France](http://www2.assemblee-nationale.fr/deputes/liste/alphabetique)

  ```ruby
    a = [
    { 
      "first_name" => "Jean",
      "last_name" => "Durant",
      "email" => "jean.durant@assemblée.fr"
    },
    { 
      "first_name" => "Martin",
      "last_name" => "Dupont",
      "email" => "martin.dupont@assemblée.fr"
    },
    etc
  ]
  ```
  
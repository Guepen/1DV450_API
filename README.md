# 1DV450_API

  * Ruby-version: 2.1.5p273

  * Rails-version: 4.1.8
  
  * Systemberoenden: Se till att att alla GEMs är installerade genom att köra bundle install.
      Om du gör detta från en windows maskin kan du komma att behöva byta ut sourcen https://rubygems.org
      till http://rubygems.org för att alla GEMs skall kunna installeras

  * För att generera upp databasen kör du kommandot: rake db:setup
  
  * För Admin-delen av applikationen används GEMet Active Admin. Om Något inte skulle
      fungera här hänvisar jag till den mycket enkla
      installationsguiden på http://activeadmin.info/docs/documentation.html

  * På modellsidan finns automatiska tester. Se till att samtliga tester går igenom.
      Du kör testerna genom att köra kommandot rake test
  
  * Starta servern genom att skriva kommandot: rails s

  * Logga in som användare:  gå till http://localhost:3000
    Logga in med användarnamnet tester och och lösenordet qwerty eller registrera ny användare
    
  * Se till att din användare har en API-nyckel: om du inte har någon API-nyckel trycker du på registrera API-nyckel
  
  * importera postmanfilen till din postman-klient som du hittar i repots root för exempelanrop
  
  ### Nu kan du börja använda API:et

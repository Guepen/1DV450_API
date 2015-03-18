
User.create(username: 'tester', email: 'tester@mail.com', password: 'qwerty', password_confirmation: 'qwerty')
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

cr = Creator.create(firstName: "Jimmy", lastName: "Andersson", username: "jimbo", password: "password")
cr2 = Creator.create(firstName: "Alexander", lastName: "Bergström", username: "alex", password: "password")
Tag.create(name: "Grymt kaffe")
Tag.create(name: "Bästa kladdkakan")
Coffeehouse.create(
    creator: cr,
    tags: Tag.all,
    name: "Fiesta Konditori",
    street: "Larmgatan 26",
    zipcode: "39232",
    city: "Kalmar"
)
Coffeehouse.create(
    creator: cr,
    name: "Krusenstiernska Gården",
    street: "St. Dammgatan 9",
    zipcode: "392 46",
    city: "Kalmar"
)
Coffeehouse.create(
    creator: cr2,
    name: "Kullzénska Caféet",
    street: "Kaggensgatan 26",
    zipcode: "392 32",
    city: "Kalmar"
)

Coffeehouse.create(
    creator: cr,
    name: "Strömssons Conditori",
    street: "Pplhemsgatan 20",
    zipcode: "392 39",
    city: "Kalmar"
)

Coffeehouse.create(
    creator: cr,
    name: "Ekelunds Konditori",
    street: "Esplanaden 11",
    zipcode: "392 34",
    city: "Kalmar"
)

Coffeehouse.create(
    creator: cr,
    name: "Danska Wienerbageriet AB",
    street: "Norra vägen 35",
    zipcode: "392 34",
    city: "Kalmar"
)

######Göteborg
Coffeehouse.create(
    creator: cr,
    name: "Mohlins Konditori",
    street: "Gamla Björlandavägen 145",
    zipcode: "417 28",
    city: "Göteborg"
)

Coffeehouse.create(
    creator: cr,
    name: "Konditori Chapman",
    street: "Gamla Björlandavägen 145",
    zipcode: "417 28",
    city: "Göteborg"
)


#######Stockholm
Coffeehouse.create(
    creator: cr2,
    name: "Cafe Järntorget",
    street: "västerlånggatan 81",
    zipcode: "111 29",
    city: "Stockholm"
)


Coffeehouse.create(
    creator: cr2,
    name: "Cafe Järntorget",
    street: "västerlånggatan 81",
    zipcode: "111 29",
    city: "Stockholm"
)
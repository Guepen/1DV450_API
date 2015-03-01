
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
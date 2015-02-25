
User.create(username: 'tester', email: 'tester@mail.com', password: 'qwerty', password_confirmation: 'qwerty')
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

cr = Creator.create(firstName: "Jimmy", lastName: "Andersson", username: "jimbo", password: "password")
cr2 = Creator.create(firstName: "Alexander", lastName: "Bergström", username: "alex", password: "password")
t = Tag.create(name: "Grymt kaffe")
t2 = Tag.create(name: "Bästa kladdkakan")
Coffeehouse.create(creator_id: cr.id, tags: t, name: "Fiesta Konditori", latitude: 56.6633596, longitude: 16.3484498 )
Coffeehouse.create(creator_id: cr.id, name: "Krusenstiernska Gården", latitude: 56.6604593, longitude: 16.3611496 )
Coffeehouse.create(creator_id: cr2.id, name: "Kullzénska Caféet",latitude: 56.663798, longitude: 16.3626404 )
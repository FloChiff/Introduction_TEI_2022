let $doc := doc("/Users/fchiffol/Downloads/index_place.xml") 
let $doc2 := doc("/Users/fchiffol/Downloads/index_person.xml")
(: On définit deux constantes qui indique que l'index des lieux sera compris dans une variable qui s'appelera doc et l'index des personnes sera doc2 et qu'on devra les appeler avec le signe $ :)
for $place in $doc//place
(: On définit une variable $place qui comprendra le contenu de chacune des balises "place" dans l'index :)
for $person in $doc2//person
(: On définit une variable $person qui comprendra le contenu de chacune des balises "person" dans l'index :)
where $place/placeName[1]=$person/birth/placeName
(: On filtre le contenu de chacune des instances pour que l'on ne récupère que les instances de "place" qui correspondent à des lieux de naissance pour des instances de "person". Ici, on effectue une jointure entre deux fichiers XML :)
return $person/persName[1] || " was a " || $person/occupation[1] || ", born in " || $place/country || '&#xa;'
(: On aura comme résultat une phrase, grâce à l'utilisation d'une technique pour concaténer, qui permet d'imprimer plusieurs éléments ensemble. Ici, le résultat contiendra le premier nom de la personne, une chaine de texte donnée, la première occupation donnée de la personne, une nouvelle chaîne de texte et le pays du lieu de naissance de la personne (récupéré grâce à la jointure entre les deux arbres XML) :)
(: L'élément de fin permet d'assurer que les résultats soient donnés ligne par ligne :)
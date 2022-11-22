(: Requête 1 :)
let $doc := doc("/Users/fchiffol/Downloads/index_place.xml") 
(: On définit une constante qui indique que l'index des lieux sera compris dans une variable qui s'appelera doc et qu'on devra appeler avec le signe $ :)
for $type in distinct-values($doc//place/@type)
(: On définit une variable $type qui comprendra les instances uniques de l'attribut @type de l'index, c'est-à-dire qu'il ne sortira aucune valeur double :)
order by $type ascending
(: On ordonne les résultats selon le type, qui sera donné par ordre alphabétique :)
return replace($type, '_', ' ')
(: On retourne les types de l'index, en remplaçant, quand ce sera le cas, le signe _ par un espace:)

(: Requête 2 :)
let $doc := doc("/Users/fchiffol/Downloads/index_person.xml")
(: On définit une constante qui indique que l'index des personnes sera compris dans une variable qui s'appelera doc et qu'on devra appeler avec le signe $ :)
for $person in $doc//person
(: On définit une variable $person qui comprendra le contenu de chacune des balises "person" dans l'index :)
where $person/sex/@value="2" and $person/nationality="French"
(: On spécifie que l'on filtre le contenu pour ne récupérer que les instances de $person où il y a une balise "sex" dont la valeur est 2 et une  balise "nationality" dont la valeur est 'French':)
order by $person/persName/text ascending
(: On ordonne le résultat par ordre alphabétique, en prenant comme référence le premier nom de personne donnée pour l'instance :)
return $person/persName[2]/text()
(: On aura comme résultat le deuxième nom de personne donnée pour l'instance :)

(: Requête 3 :)
let $doc := doc("/Users/fchiffol/Downloads/index_place.xml") 
(: On définit une constante qui indique que l'index des lieux sera compris dans une variable qui s'appelera doc et qu'on devra appeler avec le signe $ :)
for $place in $doc//place
(: On définit une variable $place qui comprendra le contenu de chacune des balises "place" dans l'index :)
order by $place/@type descending
(: On ordonne le résultat par ordre alphabétique inversé (de Z à A), en prenant comme référence le type du lieu :)
return $place/placeName[1] || " is a " || $place/@type
(: On aura comme résultat une phrase, grâce à l'utilisation d'une technique pour concaténer, qui permet d'imprimer plusieurs éléments ensemble. Ici, le résultat contiendra le premier nom de lieu, chaine de texte donnée et le type du lieu :)

(: Requête 4 :)
let $doc := doc("/Users/fchiffol/Downloads/index_person.xml")
(: On définit une constante qui indique que l'index des personnes sera compris dans une variable qui s'appelera doc et qu'on devra appeler avec le signe $ :)
for $person in $doc//person
(: On définit une variable $person qui comprendra le contenu de chacune des balises "person" dans l'index :)
where $person/nationality = "French"
(: On spécifie que l'on filtre le contenu pour ne récupérer que les instances de $person où il y a une balise "nationality" dont la valeur est 'French':)
order by $person/persName[1]/text() ascending
(: On ordonne le résultat par ordre alphabétique, en prenant comme référence le premier nom de personne donnée pour l'instance :)
return concat($person/persName[1], " was a ", $person/occupation[1], " and was born in ",$person/birth/placeName)
(: On aura comme résultat une phrase, grâce à l'utilisation de la fonction concat(), qui permet d'imprimer plusieurs éléments ensemble. Ici, le résultat contiendra le premier nom de personne, sa première occupation donnée, son lieu de naissance et les éléments de phrase donnée en chaine de texte:)

(: Requête 5 :)
let $doc := doc("/Users/fchiffol/Downloads/index_place.xml") 
let $doc2 := doc("/Users/fchiffol/Downloads/index_person.xml")
(: On définit deux constantes qui indique que l'index des lieux sera compris dans une variable qui s'appelera doc et l'index des personnes sera doc2 et qu'on devra les appeler avec le signe $ :)
for $place in $doc//place
(: On définit une variable $place qui comprendra le contenu de chacune des balises "place" dans l'index :)
for $person in $doc2//person
(: On définit une variable $person qui comprendra le contenu de chacune des balises "person" dans l'index :)
where $place/placeName[1]=$person/birth/placeName
(: On filtre le contenu de chacune des instances pour que l'on ne récupère que les instances de "place" qui correspondent à des lieux de naissance pour des instances de "person". Ici, on effectue une jointure entre deux fichiers XML :)
return $person/persName[1] || " was a " || $person/occupation[1] || ", born in " || $place/country
(: On aura comme résultat une phrase, grâce à l'utilisation d'une technique pour concaténer, qui permet d'imprimer plusieurs éléments ensemble. Ici, le résultat contiendra le premier nom de la personne, une chaine de texte donnée, la première occupation donnée de la personne, une nouvelle chaîne de texte et le pays du lieu de naissance de la personne (récupéré grâce à la jointure entre les deux arbres XML) :)
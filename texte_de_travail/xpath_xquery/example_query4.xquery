let $doc := doc("/Users/fchiffol/Downloads/index_person.xml")
(: On définit une constante qui indique que l'index des personnes sera compris dans une variable qui s'appelera doc et qu'on devra appeler avec le signe $ :)
for $person in $doc//person
(: On définit une variable $person qui comprendra le contenu de chacune des balises "person" dans l'index :)
where $person/nationality = "French"
(: On spécifie que l'on filtre le contenu pour ne récupérer que les instances de $person où il y a une balise "nationality" dont la valeur est 'French':)
order by $person/persName[1]/text() ascending
(: On ordonne le résultat par ordre alphabétique, en prenant comme référence le premier nom de personne donnée pour l'instance :)
return concat($person/persName[1], " was a ", $person/occupation[1], " and was born in ",$person/birth/placeName) || '&#xa;'
(: On aura comme résultat une phrase, grâce à l'utilisation de la fonction concat(), qui permet d'imprimer plusieurs éléments ensemble. Ici, le résultat contiendra le premier nom de personne, sa première occupation donnée, son lieu de naissance et les éléments de phrase donnée en chaine de texte:)
(: L'élément de fin permet d'assurer que les résultats soient donnés ligne par ligne :)
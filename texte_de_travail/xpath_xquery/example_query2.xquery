let $doc := doc("/Users/fchiffol/Downloads/index_person.xml")
(: On définit une constante qui indique que l'index des personnes sera compris dans une variable qui s'appelera doc et qu'on devra appeler avec le signe $ :)
for $person in $doc//person
(: On définit une variable $person qui comprendra le contenu de chacune des balises "person" dans l'index :)
where $person/sex/@value="2" and $person/nationality="French"
(: On spécifie que l'on filtre le contenu pour ne récupérer que les instances de $person où il y a une balise "sex" dont la valeur est 2 et une  balise "nationality" dont la valeur est 'French':)
order by $person/persName/text ascending
(: On ordonne le résultat par ordre alphabétique, en prenant comme référence le premier nom de personne donnée pour l'instance :)
return $person/persName[2]/text() || '&#xa;'
(: On aura comme résultat le deuxième nom de personne donnée pour l'instance :)
(: L'élément de fin permet d'assurer que les résultats soient donnés ligne par ligne :)
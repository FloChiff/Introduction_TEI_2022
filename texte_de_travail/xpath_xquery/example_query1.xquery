let $doc := doc("/Users/fchiffol/Downloads/index_place.xml") 
(: On définit une constante qui indique que l'index des lieux sera compris dans une variable qui s'appelera doc et qu'on devra appeler avec le signe $ :)
for $type in distinct-values($doc//place/@type)
(: On définit une variable $type qui comprendra les instances uniques de l'attribut @type de l'index, c'est-à-dire qu'il ne sortira aucune valeur double :)
order by $type ascending
(: On ordonne les résultats selon le type, qui sera donné par ordre alphabétique :)
return replace($type, '_', ' ') || '&#xa;'
(: On retourne les types de l'index, en remplaçant, quand ce sera le cas, le signe _ par un espace:)
(: L'élément de fin permet d'assurer que les résultats soient donnés ligne par ligne :)
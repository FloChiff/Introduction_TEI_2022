(: Requête 2 :)
let $doc := doc("/Users/fchiffol/Downloads/index_place.xml")
for $place in $doc//place
where $place/@type="city" and $place/country="Germany"
order by $place/placeName[1] ascending
return $place/placeName[1]/text() || '&#xa;'

(:
14 results
Aix-la-Chapelle
Berlin
Brême
Coblentz
Cologne
Delbruck
Francfort
Hambourg
Heidelberg
Kiel
Landau
Munich
Nuremberg
Schlesvig
:)
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei" xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <xsl:variable name="file">
            <xsl:value-of select="replace(base-uri(.), '.xml', '.html')"/>
            <!-- Récupération du nom et du chemin du fichier courant -->
        </xsl:variable>

        <xsl:result-document href="{$file}" method="html" indent="yes">
            <!-- Appel de la page HTML défini en variable précédemment, et reprenant le nom du fichier transformé,
                par le biais de <xsl:result-document> qui permet d'indiquer directement dans le fichier la sortie 
                qui sera demandé -->
            <html>
                <head>
                    <title>Encodage</title>
                </head>
                <body>
                    <h1>
                        <xsl:value-of select="string-join(//titleStmt/title, ' ; ')"/>
                        <!-- Appel de la valeur exacte contenu dans le chemin XPath défini ci-dessus -->
                    </h1>
                    <div>
                        <h2>Métadonnées</h2>
                        <div>
                            <h3>Informations textuelles</h3>
                            <li>Auteur: <xsl:apply-templates select="//titleStmt/author"/></li>
                            <li>Date originale du texte: <xsl:value-of select="//creation/@when"/></li>
                            <li>Publication: <xsl:apply-templates select="//publicationStmt"/></li>
                            <li>Lieu de conservation: <xsl:apply-templates select="//msIdentifier"/></li>
                            <li>Langue du texte: <xsl:apply-templates select="//langUsage"/>
                            </li>
                            <!-- Appel des valeurs contenus dans le header pour récupérer les métadonnées -->
                        </div>
                        <div>
                            <h3>Informations d'encodage</h3>
                            <li>
                                <xsl:apply-templates select="//projectDesc"/>
                            </li>
                            <li>
                                <xsl:apply-templates select="//correction"/>
                            </li>
                            <li>
                                <xsl:apply-templates select="//hyphenation"/>
                            </li>
                        </div>
                    </div>
                    <div>
                        <h2>Transcriptions</h2>
                        <div>
                            <h3>Texte original</h3>
                            <p>
                                <xsl:apply-templates select="//text//div[@type = 'transcription']/div[@type = 'original']/p"/>
                                <!-- On récupère la balise div que l'on veut spécifiquement faire apparaitre ici, à savoir celle le @type="original" -->
                            </p>
                        </div>
                        <div>
                            <h3>Ancien français</h3>
                            <p>
                                <xsl:apply-templates select="//text//div[@type = 'transcription']/div[@type = 'traduction']/p" mode="orig"/>
                                <!-- On va chercher dans l'arbre XML le contenu de la balise appelé dans le chemin XPath défini ci-dessus 
                                    et on spécifie que l'on veut le texte suivant le mode 'orig', c'està-dire avec le contenu de la balise 
                                    <orig> situé dans la balise <choice> comme défini plus bas -->
                            </p>
                        </div>
                        <div>
                            <h3>Français moderne</h3>
                            <p>
                                <xsl:apply-templates select="//text//div[@type = 'transcription']/div[@type = 'traduction']/p" mode="reg"/>
                            </p>
                        </div>
                    </div>
                    <div>
                        <h2>Index</h2>
                        <div>
                            <h3>Index des personnes</h3>
                            <div>
                                <xsl:call-template name="person"/>
                                <!-- Appel du template créé et défini plus bas -->
                            </div>
                        </div>
                        <div>
                            <h3>Index de lieux</h3>
                            <div>
                                <xsl:call-template name="place"/>
                            </div>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="choice" mode="orig">
        <xsl:value-of select="orig/text()"/>
    </xsl:template>
    <xsl:template match="choice" mode="reg">
        <xsl:value-of select="reg/text()"/>
    </xsl:template>
    <!-- On crée ici des modes pour choisir quelle partie de texte on veut afficher au sein de la balise <choice> qui propose deux choix-->

    <xsl:template name="place">
        <xsl:for-each select="//listPlace/place">
            <!-- Appel d'une boucle pour itérer sur les éléments, les uns après les autres -->
            <xsl:sort/>
            <li>
                <xsl:value-of select="placeName"/>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="@type"/>
                <xsl:text>), </xsl:text>
                <xsl:if test="settlement">
                    <xsl:value-of select="settlement"/>
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:value-of select="concat(region, ', ', country)"/>
            </li>
            <!-- Affiche les multiples éléments présents dans la liste de lieux sous forme de liste. Fait apparaitre tous les éléments présents dans la balise <place>
            et ajout d'une condition (<xsl:if>), pour faire apparaitre une balise, que si elle est présente dans l'arbre. -->
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="person">
        <!-- L'attribut 'name' sur template permet d'établir une méthode d'affichage pour un pan de l'arbre XML -->
        <xsl:for-each select="//listPerson/person">
            <xsl:sort/>
            <!-- Permet de trier par ordre alphabétique -->
            <li>
                <xsl:if test="persName/element()">
                    <xsl:value-of select="persName/forename"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="persName/surname"/>
                </xsl:if>
                <xsl:if test="persName/text()">
                    <xsl:value-of select="persName"/>
                </xsl:if>
            </li>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="publicationStmt">
        <xsl:for-each select="element()">
            <xsl:value-of select="text()"/>
            <xsl:choose>
                <xsl:when test="position() = last()">.</xsl:when>
                <xsl:otherwise>, </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <!-- Va chercher tous les éléments présents dans la balise <publicationStmt> et ajout d'un choix pour l'affichage, 
            avec un point quand c'est le dernier élément et une virgule dans tous les autres cas -->
    </xsl:template>

    <xsl:template match="msIdentifier">
        <xsl:for-each select="element()">
            <xsl:value-of select="text()"/>
            <xsl:choose>
                <xsl:when test="position() = last()">.</xsl:when>
                <xsl:otherwise>, </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="langUsage">
        <xsl:for-each select="language">
            <xsl:sort/>
            <xsl:value-of select="text()"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="@usage"/>
            <xsl:text> %</xsl:text>
            <xsl:choose>
                <xsl:when test="position() != last()">; </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

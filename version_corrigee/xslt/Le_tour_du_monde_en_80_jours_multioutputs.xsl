<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei" xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), '.xml', '_')"/>
            <!-- récupération du nom et du chemin du fichier courant -->
        </xsl:variable>

        <xsl:variable name="pathDiplomatic">
            <xsl:value-of select="concat($witfile, 'diplomatic', '.html')"/>
            <!-- Création d'une page HTML qui reprendra le nom du fichier XML comme défini dans la variable précédente -->
        </xsl:variable>
        <xsl:variable name="pathReading">
            <xsl:value-of select="concat($witfile, 'reading', '.html')"/>
            <!-- Création d'une page HTML qui reprendra le nom du fichier XML comme défini dans la variable précédente -->
        </xsl:variable>
        <xsl:variable name="pathIndex">
            <xsl:value-of select="concat($witfile, 'index', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathMetadonnees">
            <xsl:value-of select="concat($witfile, 'metadonnees', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathAccueil">
            <xsl:value-of select="concat($witfile, 'accueil', '.html')"/>
        </xsl:variable>
        <xsl:result-document href="{$pathAccueil}" method="html" indent="yes">
            <!-- Appel de la page HTML défini en variable précédemment et création d'un nouveau fichier HTML 
                par le biais de <xsl:result-document> qui permet la transformation en plusieurs fichiers -->
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title[@type = 'main']"/>
                        <!-- Appel de la valeur exacte contenu dans le chemin XPath défini ci-dessus -->
                    </title>
                    <style type="text/css">
                        h3 {
                        color: blue;
                        }
                        li {
                        list-style-type: circle;
                        font-size: 20px;
                        font-weight: bold;
                        }
                    </style>
                </head>
                <body>
                    <h1>
                        <xsl:value-of select="//titleStmt/title[@type = 'main']"/>
                    </h1>
                    <ul>
                        <li>
                            <a href="{$pathMetadonnees}">Métadonnées</a>
                        </li>
                        <li>
                            <a href="{$pathIndex}">Index des entités</a>
                        </li>
                        <li>
                            <a href="{$pathDiplomatic}">Version diplomatique</a>
                        </li>
                        <li>
                            <a href="{$pathReading}">Version de lecture</a>
                        </li>
                    </ul>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$pathIndex}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title[@type = 'main']"/>
                    </title>
                    <style type="text/css">
                        h2 {
                        text-decoration: underline;
                        }
                        h3 {
                        font-style: italic;
                        }
                    </style>
                </head>
                <body>
                    <h1>
                        <xsl:value-of select="//titleStmt/title[@type = 'main']"/>
                    </h1>
                    <span>
                        <a href="{$pathAccueil}">Retour accueil</a>
                    </span>
                    <h2>Index</h2>
                    <div>
                        <h3>Index des personnes</h3>
                        <div>
                            <xsl:call-template name="person"/>
                        </div>
                    </div>
                    <div>
                        <h3>Index de lieux</h3>
                        <div>
                            <xsl:call-template name="place"/>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$pathDiplomatic}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title[@type = 'main']"/>
                    </title>
                    <style type="text/css">
                        h2 {
                        text-decoration: underline;
                        }
                        h6 {
                        font-size: 16px;
                        }
                    </style>
                </head>
                <body>
                    <h1>
                        <xsl:value-of select="//titleStmt/title[@type = 'main']"/>
                    </h1>
                    <span>
                        <a href="{$pathAccueil}">Retour accueil</a>
                    </span>
                    <div>
                        <a href="https://gallica.bnf.fr/ark:/12148/btv1b8600244d" target="_blank">Lien vers le
                            manuscrit</a>
                    </div>
                    <div>
                        <h2>Transcription</h2>
                            <p>
                                <xsl:apply-templates select="//text//div[@type='chapter']" mode="diplomatic"/>
                            </p>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$pathReading}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title[@type = 'main']"/>
                    </title>
                    <style type="text/css">
                        h2 {
                        text-decoration: underline;
                        }
                        h6 {
                        font-size: 16px;
                        }
                    </style>
                </head>
                <body>
                    <h1>
                        <xsl:value-of select="//titleStmt/title[@type = 'main']"/>
                    </h1>
                    <span>
                        <a href="{$pathAccueil}">Retour accueil</a>
                    </span>
                    <div>
                        <a href="https://gallica.bnf.fr/ark:/12148/btv1b8600244d" target="_blank">Lien vers le
                            manuscrit</a>
                    </div>
                    <div>
                        <h2>Transcription</h2>
                        <div>
                            <h3>Version de lecture</h3>
                            <p>
                                <xsl:apply-templates select="//text//div[@type='chapter']" mode="reading"/>
                            </p>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        <xsl:result-document href="{$pathMetadonnees}" method="html" indent="yes">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>
                        <xsl:value-of select="//titleStmt/title[@type = 'main']"/>
                    </title>
                    <style type="text/css">
                        h2 {
                        text-decoration: underline;
                        }
                        h3 {
                        font-style: italic;
                        }
                    </style>
                </head>
                <body>
                    <h1>
                        <xsl:value-of select="//titleStmt/title[@type = 'main']"/>
                    </h1>
                    <span>
                        <a href="{$pathAccueil}">Retour accueil</a>
                    </span>
                    <div>
                        <h2>Métadonnées</h2>
                        <div>
                            <h3>Informations textuelles</h3>
                            <li>Titre : <xsl:value-of select="//titleStmt/title"/></li>
                            <li>Auteur : <xsl:apply-templates select="//titleStmt/author"/></li>
                            <li><xsl:value-of select="//titleStmt/respStmt/resp"/> : <xsl:value-of select="string-join(//titleStmt/respStmt/persName, ' ; ')"/></li>
                            <li>Publication : <xsl:apply-templates select="//publicationStmt"/></li>
                            <li>Collection : <xsl:value-of select="//seriesStmt/title"/> ; <xsl:value-of select="concat(//seriesStmt/respStmt/resp, ' ', //seriesStmt/respStmt/persName)"/></li>
                            <li>Lieu de conservation : <xsl:apply-templates select="//msIdentifier"/></li>
                            <li>Informations supplémentaires : <xsl:value-of select="concat(//objectType, ', ', //extent)"/>
                            </li>
                        </div>
                        <div>
                            <h3>Informations d'encodage</h3>
                            <li>
                                <xsl:apply-templates select="//projectDesc"/>
                            </li>
                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template name="place">
        <xsl:for-each select="//listPlace/place">
            <xsl:sort/>
            <li><xsl:choose>
                <xsl:when test="idno">
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:text>https://www.geonames.org/</xsl:text>
                            <xsl:value-of select="idno"/>
                        </xsl:attribute>
                        <xsl:attribute name="target">
                            <xsl:text>_blank</xsl:text>
                        </xsl:attribute>
                        <xsl:value-of select="placeName"/>
                    </xsl:element>
                </xsl:when>
                <xsl:otherwise><xsl:value-of select="placeName"/></xsl:otherwise>
            </xsl:choose>
                <xsl:text> (</xsl:text>
                <xsl:value-of select="@type"/>
                <xsl:text>)</xsl:text>
                <xsl:if test="country">
                    <xsl:text>, </xsl:text>
                    <xsl:value-of select="country"/>
                </xsl:if>
                <xsl:text> ; Coordonnées géographiques : 
                </xsl:text>
                <xsl:value-of select="location/geo"/>
            </li>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="person">
        <xsl:for-each select="//listPerson/person">
            <li>
                <xsl:value-of select="concat(persName, ', ', nationality, ', ', sex/@value, ', ', occupation, '.')"/>
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
    
    <xsl:template match="persName|orgName|placeName" mode="reading">
        <xsl:element name="i">
            <xsl:value-of select="text()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="note" mode="#all">
        <xsl:element name="h6">
            <xsl:value-of select="text()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pb" mode="reading">
        <xsl:element name="br"/>
        <xsl:element name="br"/>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="target">
                <xsl:text>_blank</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="@facs"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="pb" mode="diplomatic">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="target">
                <xsl:text>_blank</xsl:text>
            </xsl:attribute>
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="@facs"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    <xsl:text>500</xsl:text>
                </xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="lb" mode="diplomatic">
        <xsl:element name="br"/>
    </xsl:template>
    
    <xsl:template match="//div//title" mode="#all">
        <xsl:element name="h5">
            <xsl:value-of select="text()"/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>

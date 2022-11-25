<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei" xmlns="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:variable name="file">
            <xsl:value-of select="replace(base-uri(.), '.xml', '.html')"/>
            <!-- Création d'une variable portant le nom du fichier courant -->
        </xsl:variable>

        <xsl:result-document href="{$file}" method="html" indent="yes">
            <!-- Création du fichier de sortie avec le nom du fichier XML grâce à la variable créée précédemment -->
            
            <html>
                <head>
                    <title>Encodage</title>
                </head>
                <body>
                    <div>
                        <h1>Métadonnées</h1>
                        <li>Titre : <xsl:value-of select="//titleStmt/title"/></li>
                        <li>Auteur : <xsl:apply-templates select="//titleStmt/author"/></li>
                        <li><xsl:value-of select="//titleStmt/respStmt/resp"/> : <xsl:value-of select="string-join(//titleStmt/respStmt/persName, ' ; ')"/></li>
                        <li>Publication : <xsl:apply-templates select="//publicationStmt"/></li>
                        <li>Collection : <xsl:apply-templates select="concat(//seriesStmt/title, ', ', //seriesStmt/respStmt)"/></li>
                        <li>Lieu de conservation : <xsl:apply-templates select="//msIdentifier"/></li>
                        <li>Informations supplémentaires : <xsl:value-of select="concat(//objectType, ', ', //extent)"/>
                        </li>
                    </div>
                    <div>
                        <h1>Texte</h1>
                        <p>
                            <xsl:apply-templates select="//text//div[@type='chapter']"/>
                        </p>
                    </div>
                </body>
            </html>
        </xsl:result-document>
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
        <!-- Même chose qu'auparavant -->
    </xsl:template>
    
    <xsl:template match="persName|orgName|placeName">
        <xsl:element name="i">
            <xsl:value-of select="text()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="note">
        <xsl:element name="h6">
            <xsl:value-of select="text()"/>
        </xsl:element>
    </xsl:template>
       
   <xsl:template match="pb">
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
       
    <xsl:template match="lb">
        <xsl:element name="br"/>
    </xsl:template>
    
    <xsl:template match="//div//title">
        <xsl:element name="h5">
            <xsl:value-of select="text()"/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>

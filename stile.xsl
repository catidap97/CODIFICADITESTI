<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Progetto di Codifica di Testi - E. Artom</title>
                <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />
                <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
                <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
                <script src="script.js"></script>
                <link href="stile.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <header>
                    <div>
                        <h1>
                            <xsl:value-of select="//tei:title[@xml:lang='it']" />
                        </h1>
                    </div>
                </header>

                <nav class="navMenu">
                    <ul>
                        <li>
                            <a href="#info">Informazioni</a>
                        </li>
                        <li>
                            <a href="#p125">Pagina 125</a>
                        </li>
                        <li>
                            <a href="#p126">Pagina 126</a>
                        </li>
                        <li>
                            <a href="#p127">Pagina 127</a>
                        </li>
                        <li>
                            <a href="#append">Riferimenti</a>
                        </li>
                    </ul>
                </nav>
                <div>
                    <div id="info">
                        <article>
                            <h1>Caratteristiche</h1>
                            <div>
                                <div>
                                    <xsl:apply-templates select="//tei:history" />
                                </div>
                                <div>
                                    <h2>Descrizione fisica</h2>
                                    <xsl:apply-templates select="//tei:physDesc" />
                                </div>
                            </div>
                        </article>

                        <div id="fenomeni">

                            <ul class="legend">
                                <li>
                                    <span class="add"></span>Aggiunte</li>
                                <li>
                                    <span class="del"></span>Cancellazioni</li>
                                <li>
                                    <span class="gap"></span>Gap</li>
                            </ul>

                            <div id="bottoni">
                                <h3>Visualizza fenomeni notevoli</h3>
                                <button id="btn-add">Aggiunte</button>
                                <button id="btn-del">Cancellazioni</button>
                                <button id="btn-gap">Gap</button>
                                <button id="btn-hide">Nascondi tutti i fenomeni notevoli</button>
                            </div>
                        </div>


                    </div>
                </div>
                <article id="p125">
                    <h2> Pagina 125 </h2>
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='Pag125']" />
                        </div>
                        <div class="text">
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '125']" />
                        </div>

                    </div>

                </article>

                <article id="p126">
                    <h2> Pagina 126 </h2>
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='Pag126']" />
                        </div>
                        <div class="text">
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '126']" />
                        </div>

                    </div>

                </article>

                <article id="p127">
                    <h2> Pagina 127 </h2>
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='Pag127']" />
                        </div>
                        <div class="text">
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '127']" />
                        </div>

                    </div>

                </article>

                <div id="append">
                    <h3 id="about">Riferimenti</h3>
                    <xsl:apply-templates select="//tei:editionStmt"/>
                </div>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="tei:editionStmt">
        <p>
            <xsl:value-of select="current()/tei:edition"></xsl:value-of>
        </p>
        <p>Progetto a cura di: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='CDP']"></xsl:value-of>
        </p>
        <p>Coordinato da: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='AMDG']"></xsl:value-of>
        </p>
    </xsl:template>


    <xsl:template match="tei:history">
        <xsl:element name="div">
            <xsl:attribute name="id">history</xsl:attribute>
            <xsl:element name="h3">Cenni storici</xsl:element>
            <xsl:element name="h4">Origine della bozza</xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">info</xsl:attribute>
                <xsl:attribute name="id">docOrigin</xsl:attribute>
                <xsl:apply-templates select="current()/tei:origin" />
            </xsl:element>
            <xsl:element name="h5">Acquisizione</xsl:element>
            <xsl:element name="div">
                <xsl:attribute name="class">info</xsl:attribute>
                <xsl:attribute name="id">docAcq</xsl:attribute>
                <xsl:apply-templates select="current()/tei:acquisition" />
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- Templates dei fenomeni del documento -->

    <xsl:template match="tei:gap">
        <gap>?</gap>
    </xsl:template>

    <xsl:template match="tei:del">
        <del>
            <xsl:apply-templates />
        </del>
    </xsl:template>

    <xsl:template match="tei:persName">
        <persName>
            <xsl:apply-templates />
        </persName>
    </xsl:template>


    <xsl:template match="tei:add">
        <add>
            <xsl:apply-templates />
        </add>
    </xsl:template>


    <xsl:template match="tei:sic">
        <sic>
            <xsl:apply-templates />
        </sic>
    </xsl:template>


    <xsl:template match="tei:corr">
        <corr>
            <xsl:apply-templates />
        </corr>
    </xsl:template>


    <xsl:template match="tei:mentioned">
        <mentioned>
            <xsl:apply-templates />
        </mentioned>
    </xsl:template>


    <xsl:template match="tei:abbr">
        <abbr>
            <xsl:value-of select="current()" />
        </abbr>
    </xsl:template>

    <xsl:template match="tei:expan">
        <expan>
            <xsl:value-of select="current()" />
        </expan>
    </xsl:template>



    <xsl:template match="tei:term">
        <term>
            <xsl:apply-templates />
        </term>
    </xsl:template>



    <xsl:template match="tei:emph[@rend = 'underline']">
        <u>
            <xsl:apply-templates />
        </u>
    </xsl:template>


    <xsl:template match="tei:pb">
        <xsl:element name="div">
            <xsl:attribute name="id">pagina_<xsl:value-of select="current()/@n" />
            </xsl:attribute>
        </xsl:element>
    </xsl:template>


    <xsl:template match="tei:lb">
        <br />
        <xsl:element name="span">
            <xsl:attribute name="class">numeroRiga</xsl:attribute>
            <b>
                <xsl:value-of select="@n" />
            </b>
        </xsl:element>
    </xsl:template>


    <xsl:template match="tei:placeName | tei:country">
        <placename>
            <xsl:apply-templates />
        </placename>
    </xsl:template>



    <xsl:template match="tei:surface">
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="concat(@xml:id, '.jpg')" />
            </xsl:attribute>
        </xsl:element>
    </xsl:template>



</xsl:stylesheet>

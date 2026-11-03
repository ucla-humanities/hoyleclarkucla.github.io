<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="book.100.fileDesc.xsl"/>
  <xsl:include href="book.210.bookKeys.xsl"/>
  <xsl:include href="book.400.keys.xsl"/>

  <xsl:template match="printers">
    <html>
      <head>
        <link href="books/book.css" rel="stylesheet" type="text/css"/>
      </head>
      <body>
        <xsl:apply-templates select="header"/>
        <h2>Printers</h2>
        <xsl:apply-templates select="printer"/>
        <xsl:apply-templates select="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="printer">
    <h3>
      <xsl:value-of select="name"/>
    </h3>
    <xsl:apply-templates select="subName"/>
    <ul>
      <xsl:apply-templates select="books/book"/>
    </ul>

  </xsl:template>

  <xsl:template match="subName">
    <h4>
      <xsl:text>...</xsl:text>
      <xsl:value-of select="."/>
    </h4>
  </xsl:template>

</xsl:stylesheet>

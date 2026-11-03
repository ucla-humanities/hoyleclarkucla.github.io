<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="book.100.fileDesc.xsl"/>
  <xsl:include href="book.210.bookKeys.xsl"/>
  <xsl:include href="book.400.keys.xsl"/>

  <xsl:template match="dedicatees">
    <html>
      <head>
        <link href="books/book.css" rel="stylesheet" type="text/css"/>
      </head>
      <body>
        <xsl:apply-templates select="header"/>
        <h2>Dedicatees</h2>
        <xsl:apply-templates select="dedicatee"/>
        <xsl:apply-templates select="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="dedicatee">
    <h3>
      <xsl:value-of select="name"/>
    </h3>
    <ul>
      <xsl:apply-templates select="books/book"/>
    </ul>

  </xsl:template>

  </xsl:stylesheet>

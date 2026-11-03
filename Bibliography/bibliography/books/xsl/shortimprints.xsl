<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="book.100.fileDesc.xsl"/>
  <xsl:include href="book.210.bookKeys.xsl"/>

  <xsl:template match="shortImprint">
    <html>
      <head>
        <link href="books/book.css" rel="stylesheet" type="text/css"/>
        <style>
          table{
              border:none;
          }
          td{
              border:none;
              padding-top:0px;
              padding-bottom:0px;
          }</style>
      </head>

      <body>
        <xsl:apply-templates select="header"/>
        <h2>Short Imprint Index</h2>
        <xsl:apply-templates select="imprint"/>
        <xsl:apply-templates select="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="imprint">
    <h3>
      <xsl:value-of select="name"/>
    </h3>
    <ul>
      <xsl:apply-templates select="books/book"/>
    </ul>
  </xsl:template>

  <xsl:template match="book">
    <li>
      <a href="{fn}">
        <xsl:value-of select="idno"/>
      </a>
      <xsl:text>: </xsl:text>
      <i>
        <xsl:apply-templates select="shortTitle"/>
      </i>
      <xsl:apply-templates select="description"/>
      <xsl:apply-templates select="statedEdition"/>
      <xsl:apply-templates select="pubYear"/>
    </li>
  </xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="book.100.fileDesc.xsl"/>
  <xsl:include href="book.210.bookKeys.xsl"/>

  <xsl:template match="shortTitle">
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
        <h2>Short Title Index</h2>
        <xsl:apply-templates select="title"/>
        <xsl:apply-templates select="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="title">
    <h3>
      <i>
        <xsl:value-of select="name"/>
      </i>
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
      <xsl:apply-templates select="shortImprint"/>
      <xsl:apply-templates select="description"/>
      <xsl:apply-templates select="statedEdition"/>
      <xsl:apply-templates select="pubYear"/>
    </li>
  </xsl:template>

  <!-- Never have a comma before shortImprint -->
  <xsl:template match="shortImprint">
    <xsl:value-of select="."/>
  </xsl:template>

  <!-- A comma before description only when there was already a shortImprint -->
  <xsl:template match="description">
    <xsl:if test="./../shortImprint">
      <xsl:text>, </xsl:text>
    </xsl:if>
    <xsl:value-of select="."/>
  </xsl:template>

</xsl:stylesheet>

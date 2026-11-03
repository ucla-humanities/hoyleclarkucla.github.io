<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="book.100.fileDesc.xsl"/>
  <xsl:include href="book.210.bookKeys.xsl"/>

  <xsl:template match="libraries">
    <html>
      <head>
        <link href="books/book.css" rel="stylesheet" type="text/css"/>
      </head>
      <body>
        <xsl:apply-templates select="header"/>
        <h2>Links to Library Catalogues</h2>
        <xsl:apply-templates select="location"/>
        <xsl:apply-templates select="footer"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="location">
    <h3>
      <xsl:value-of select="continent"/>
    </h3>
    <table border="2">
      <xsl:apply-templates select="library"/>
    </table>
  </xsl:template>

  <xsl:template match="library">
    <tr>
<xsl:choose>
  <xsl:when test="url=''">
    <td width="150">
      <xsl:value-of select="libraryCode"/>
      
    </td>
  </xsl:when>
  <xsl:otherwise>
    <td width="150">
      <a href="{url}"  target="blank_">
        <xsl:value-of select="libraryCode"/>
      </a>
    </td>
    
  </xsl:otherwise>
</xsl:choose>
      <td width="800">
        <xsl:value-of select="name"/>
      </td>
      <td width="800">
        <xsl:value-of select="location"/>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>

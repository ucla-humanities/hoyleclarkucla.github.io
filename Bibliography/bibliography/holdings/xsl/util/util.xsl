<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="header">
		<hr SIZE="6" WIDTH="100%"/>
		<h2 align="center">A Descriptive Bibliography of Edmond Hoyle</h2>
		<p align="center">Copyright &#169; 2014-24 by David Levy</p>

		<xsl:variable name="DATE">
			<xsl:value-of select="dateUpdate"/>
		</xsl:variable>

		<xsl:variable name="DATESTR">
			<xsl:value-of select="concat('(page updated ' , $DATE, ')')"/>
		</xsl:variable>

		<p align="center">
			<xsl:value-of select="$DATESTR"/>
		</p>
		<hr SIZE="6" WIDTH="100%"/>
		
	</xsl:template>
	
	<xsl:template match="footer">
		<hr size="6" width="100%"/>
		<p align="center">
			<a HREF="mailto:trictrac@sbcglobal.net?subject={fn}">Feedback?</a>
		</p>
		<p align="center">
			<a HREF="{home}">Home</a>
		</p>
	</xsl:template>
		
</xsl:stylesheet>

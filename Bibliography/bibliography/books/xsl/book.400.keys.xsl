<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="book">
		<li>
			<a href="{fn}">
				<xsl:value-of select="idno"/>
			</a>
			<xsl:text>: </xsl:text>
			<i>
				<xsl:value-of select="shortTitle"/>
			</i>
			<xsl:apply-templates select="shortImprint"/>
			<xsl:apply-templates select="description"/>
			<xsl:apply-templates select="statedEdition"/>
			<xsl:apply-templates select="pubYear"/>
		</li>
	</xsl:template>

</xsl:stylesheet>

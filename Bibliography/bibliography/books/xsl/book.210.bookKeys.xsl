<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="bookKeys">
		<h2>
			<xsl:value-of select="idno"/>
		</h2>
		<h3>
			<xsl:apply-templates select="shortTitle"/>
			<xsl:apply-templates select="shortImprint"/>
			<xsl:apply-templates select="description"/>
			<xsl:apply-templates select="statedEdition"/>
			<xsl:apply-templates select="pubYear"/>
			<xsl:if test="pubYear[@isUncertain]">
				<xsl:text>?</xsl:text>
			</xsl:if>
			<xsl:if test="not(pubYear[@isUncertain])">
				<xsl:text>.</xsl:text>
			</xsl:if>
		</h3>
	</xsl:template>

	<xsl:template match="shortTitle">
		<span id="italic">
			<xsl:value-of select="."/>
		</span>
	</xsl:template>

	<xsl:template match="shortImprint | description | statedEdition | pubYear">
		<xsl:text>, </xsl:text>
		<xsl:value-of select="."/>
	</xsl:template>

</xsl:stylesheet>

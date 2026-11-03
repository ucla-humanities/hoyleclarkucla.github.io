<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="titlePart | contentPart | RTPart | cwFoot | cwHead | note">
		
		<xsl:variable name="style" select="@rend"/>
		
		<xsl:choose>
			<xsl:when test="@rend = 'paragraph'">
				<p/>
			</xsl:when>
			<xsl:when test="@rend = 'break'">
				<br/>
			</xsl:when>
			<xsl:when test="not(@rend)">
				<span id="roman">
					<xsl:value-of select="."/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<span id="{$style}">
					<xsl:value-of select="."/>
				</span>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>

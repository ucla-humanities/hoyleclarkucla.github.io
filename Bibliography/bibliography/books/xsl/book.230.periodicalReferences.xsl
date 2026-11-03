<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="periodicalReferences">

		<xsl:if test="periodicalReference/@periodicalType = 'advertisement'">
			<tr>
				<td id="row-label">Advertisements: </td>
				<td>
					<xsl:for-each select="periodicalReference">
						<xsl:if test="@periodicalType = 'advertisement'">
							<xsl:apply-templates select="."/>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="periodicalReference/@periodicalType = 'notice'">
			<tr>
				<td id="row-label">Notices: </td>
				<td>
					<xsl:for-each select="periodicalReference">
						<xsl:if test="@periodicalType = 'notice'">
							<xsl:apply-templates select="."/>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="periodicalReference/@periodicalType = 'review'">
			<tr>
				<td id="row-label">Reviews: </td>
				<td>
					<xsl:for-each select="periodicalReference">
						<xsl:if test="@periodicalType = 'review'">
							<xsl:apply-templates select="."/>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>

	</xsl:template>

	<xsl:template match="periodicalReference">
		<!-- If there is a second periodicalReference of the same type, add a line break -->
		<xsl:if test="@periodicalType = preceding-sibling::periodicalReference/@periodicalType">
			<br/>
		</xsl:if>

		<xsl:value-of select="pubDate"/>
		<xsl:text> </xsl:text>
		<span id="italic">
			<xsl:value-of select="publication"/>
		</span>
		<xsl:if test="notes">
			<xsl:text>: </xsl:text>
			<xsl:apply-templates select="notes"/>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="respStmt">

		<xsl:if test="respItem/@respType = 'publisher'">
			<tr>
				<td id="row-label">Publisher: </td>
				<td>
					<xsl:for-each select="respItem">
						<xsl:if test="@respType = 'publisher'">
							<xsl:apply-templates select="."/>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="respItem/@respType = 'printer'">
			<tr>
				<td id="row-label">Printer: </td>
				<td>
					<xsl:for-each select="respItem">
						<xsl:if test="@respType = 'printer'">
							<xsl:apply-templates select="."/>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="respItem/@respType = 'translator'">
			<tr>
				<td id="row-label">Translator: </td>
				<td>
					<xsl:for-each select="respItem">
						<xsl:if test="@respType = 'translator'">
							<xsl:apply-templates select="."/>
						</xsl:if>
					</xsl:for-each>
				</td>
			</tr>
		</xsl:if>

	</xsl:template>

	<xsl:template match="respItem">
		<!-- If there is a second respItem of the same type, add a line break -->
		<xsl:if test="@respType = preceding-sibling::respItem/@respType">
			<xsl:text>, </xsl:text>
		</xsl:if>

		<xsl:apply-templates select="persName"/>
		<xsl:value-of select="orgName"/>
		<xsl:if test="evidence">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="evidence"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="persName">
		<xsl:value-of select="forename"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="surname"/>
	</xsl:template>

</xsl:stylesheet>

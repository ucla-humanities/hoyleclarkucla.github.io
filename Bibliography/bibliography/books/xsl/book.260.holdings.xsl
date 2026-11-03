<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="holdings">

		<xsl:if test="count(holding[@isSeen = 'true' and not(@isCollection = 'true')]) > 0">
			<tr>
				<td id="row-label">Copies Seen:</td>
				<td>
					<xsl:apply-templates
						select="holding[@isSeen = 'true' and not(@isCollection = 'true')]"/>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="count(holding[@isSeen = 'true' and @isCollection = 'true']) > 0">
			<tr>
				<td id="row-label">Copies Seen in Collections:</td>
				<td>
					<xsl:apply-templates
						select="holding[@isSeen = 'true' and @isCollection = 'true']"/>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="count(holding[@isSeen = 'false' and not(@isCollection = 'true')]) > 0">
			<tr>
				<td id="row-label">Other Copies:</td>
				<td>
					<xsl:apply-templates
						select="holding[@isSeen = 'false' and not(@isCollection = 'true')]"/>
				</td>
			</tr>
		</xsl:if>

		<xsl:if test="count(holding[@isSeen = 'false' and @isCollection = 'true']) > 0">
			<tr>
				<td id="row-label">Other Copies in Collections:</td>
				<td>
					<xsl:apply-templates
						select="holding[@isSeen = 'false' and @isCollection = 'true']"/>
				</td>
			</tr>
		</xsl:if>

	</xsl:template>

	<xsl:template match="holding">
		<xsl:value-of select="holder"/>
		<xsl:apply-templates select="shelfmark"/>
		<xsl:apply-templates select="copies"/>
		<xsl:apply-templates select="surrogate"/>
		<xsl:apply-templates select="notes"/>
		<xsl:apply-templates select="idno"/>
		<xsl:apply-templates select="holdingParts"/>
		<xsl:choose>
			<xsl:when test="position() = last() or count(holdingParts) > 0"/>
			<xsl:when test="/entry/bookDesc[1]/collectedParts[1]">
				<br/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>; </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="shelfmark">
		<xsl:text> [</xsl:text>
		<xsl:value-of select="."/>
		<xsl:text>]</xsl:text>
	</xsl:template>

	<xsl:template match="copies">
		<xsl:text> [</xsl:text>
		<xsl:value-of select="."/>
		<xsl:text> copies]</xsl:text>
	</xsl:template>

	<xsl:template match="surrogate">
		<xsl:text> (</xsl:text>
		<xsl:choose>
			<xsl:when test="@url">
				<xsl:variable name="URL">
					<xsl:value-of select="@url"/>
				</xsl:variable>
				<a href="{$URL}" target="blank_">
					<xsl:value-of select="."/>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>)</xsl:text>
	</xsl:template>

	<xsl:template match="holdingParts">
		<xsl:text>: </xsl:text>
		<xsl:apply-templates select="holdingPart"/>
		<br/>
	</xsl:template>

	<xsl:template match="holdingPart">
		<xsl:text> </xsl:text>
		<span id="italic">
			<xsl:value-of select="idno"/>
		</span>
		<xsl:apply-templates select="shelfmark"/>
		<xsl:if test="position() != last()">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="entry/bookDesc/holdings/holding/idno">
		<xsl:text> (see </xsl:text>
		<xsl:variable name="URL-SUFF" select="'.xml'"/>
		<xsl:variable name="BOOK">
			<xsl:value-of select="."/>
		</xsl:variable>
		<xsl:variable name="LOWER"
			select="translate($BOOK, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
		<xsl:variable name="URL">
			<xsl:value-of select="concat($LOWER, $URL-SUFF)"/>
		</xsl:variable>
		<a href="{$URL}">
			<xsl:value-of select="$BOOK"/>
		</a>
		<xsl:text>)</xsl:text>
		<xsl:if test="position() != last()">
			<br/>
		</xsl:if>

	</xsl:template>

</xsl:stylesheet>

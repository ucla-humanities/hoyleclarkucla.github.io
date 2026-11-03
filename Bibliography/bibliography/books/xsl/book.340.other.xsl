<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="imprimatur">
		<tr>
			<td id="row-label">Imprimatur: </td>
			<td>
				<xsl:apply-templates select="notes"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="colophon">
		<tr>
			<td id="row-label">Colophon: </td>
			<td>
				<xsl:apply-templates select="notes"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="/entry/text/plates">
		<tr>
			<td id="row-label">Plates:</td>
			<td>
				<xsl:apply-templates select="plate"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="plate">
		<xsl:choose>
			<xsl:when test="@plateLocation">
				<xsl:value-of select="@plateLocation"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="plateRelation"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="dupSeqSig"/>
				<xsl:apply-templates select="multSig"/>
				<xsl:apply-templates select="sigRef"/>
				<xsl:if test="pageRef">
					<xsl:text>(</xsl:text>
					<xsl:apply-templates select="dupSeqPage"/>
					<xsl:value-of select="pageRef"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:value-of select="plateType"/>
		<xsl:text>: </xsl:text>
		<xsl:apply-templates select="notes"/>
		<xsl:if test="position() != last()">
			<br/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="catchwords">
		<tr>
			<td id="row-label">Catchwords:</td>
			<td>
				<xsl:apply-templates select="catchword"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="catchword">
		<xsl:apply-templates select="dupSeqSig"/>
		<xsl:apply-templates select="sigRef"/>
		<xsl:if test="pageRef">
			<xsl:text>(</xsl:text>
			<xsl:apply-templates select="dupSeqPage"/>
			<xsl:value-of select="pageRef"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cwFoot"/>
		<xsl:text> [</xsl:text>
		<xsl:apply-templates select="cwHead"/>
		<xsl:text>]</xsl:text>
		<xsl:if test="position() != last()">
			<xsl:text>; </xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="pressFigures">
		<tr>
			<td id="row-label">Press Figures:</td>
			<td>
				<xsl:apply-templates select="pressFigure"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="pressFigure">
		<xsl:apply-templates select="dupSeqSig"/>
		<xsl:value-of select="multSig"/>
		<xsl:apply-templates select="sigRef"/>
		<xsl:text>(</xsl:text>
		<xsl:value-of select="forme"/>
		<xsl:text>):</xsl:text>
		<xsl:value-of select="mark"/>
		<xsl:if test="position() != last()">
			<xsl:text>; </xsl:text>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>

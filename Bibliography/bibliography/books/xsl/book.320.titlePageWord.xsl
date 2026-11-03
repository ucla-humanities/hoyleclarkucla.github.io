<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="titlePage">

		<xsl:variable name="LABEL">
			<xsl:choose>
				<xsl:when test="@titleType = 'cover'">
					<xsl:value-of select="'Cover:'"/>
				</xsl:when>
				<xsl:when test="@titleType = 'engravedTitle'">
					<xsl:value-of select="'Engraved Title:'"/>
				</xsl:when>
				<xsl:when test="@titleType = 'frontispiece'">
					<xsl:value-of select="'Frontispiece:'"/>
				</xsl:when>
				<xsl:when test="@titleType = 'halfTitle'">
					<xsl:value-of select="'Half Title:'"/>
				</xsl:when>
				<xsl:when test="@titleType = 'label'">
					<xsl:value-of select="'Label:'"/>
				</xsl:when>
				<xsl:when test="@titleType = 'section'">
					<xsl:variable name="PT1">
						<xsl:value-of select="'Section Title '"/>
					</xsl:variable>
					<xsl:variable name="PT2">
						<xsl:choose>
							<xsl:when test="@sectionID">
								<xsl:value-of select="concat($PT1, @sectionID)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$PT1"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<xsl:choose>
						<xsl:when test="@isCancellandum">
							<xsl:value-of select="concat($PT2, (Cancellandum))"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$PT2"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="@titleType = 'slipcase'">
					<xsl:value-of select="'Slipcase:'"/>
				</xsl:when>
				<xsl:when test="@titleType = 'title'">
					<xsl:choose>
						<xsl:when test="@isCancellandum">
							<xsl:value-of select="'Title (Cancellandum):'"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="'Title:'"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="@titleType = 'wrapper'">
					<xsl:value-of select="'Wrapper:'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'OTHER'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>


		<!-- OTHER TITLE WITHOUT IMAGE-->
		<tr>
			<td id="row-label">
				<xsl:value-of select="$LABEL"/>
			</td>
			<td>
				<xsl:apply-templates select="titlePart"/>
			</td>
		</tr>

	</xsl:template>

</xsl:stylesheet>

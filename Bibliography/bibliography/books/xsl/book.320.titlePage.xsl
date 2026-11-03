<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="titlePage">

		<xsl:variable name="IMG">
			<xsl:variable name="IMG-FN">
				<xsl:value-of select="@imageFN"/>
			</xsl:variable>
			<xsl:variable name="IMG-FT" select="'.jpg'"/>
			<xsl:value-of select="concat($IMG-FN, $IMG-FT)"/>
		</xsl:variable>

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

		<!-- MAIN TITLE WITH IMAGE -->
		<xsl:choose>
			<xsl:when test="@imageFN and @titleType = 'title' and not(@isCancellandum)">
				<tr>
					<td class="image" rowspan="2">
						<img src="../images/{$IMG}" border="1"/>
					</td>
					<td id="row-label">
						<xsl:value-of select="$LABEL"/>
					</td>
					<td>
						<xsl:apply-templates select="titlePart"/>
					</td>
				</tr>
				<tr>
					<xsl:apply-templates select="../collation"/>
				</tr>
			</xsl:when>

			<!-- MAIN TITLE WITHOUT IMAGE -->
			<xsl:when test="
					@titleType = 'title' and not(@isCancellandum) and not(@imageFN)">
				<tr>
					<td id="row-label">
						<xsl:value-of select="$LABEL"/>
					</td>
					<td>
						<xsl:apply-templates select="titlePart"/>
					</td>
				</tr>
				<tr>
					<xsl:apply-templates select="../collation"/>
				</tr>
			</xsl:when>

			<!-- OTHER TITLE WITH IMAGE-->
			<xsl:when test="@imageFN">
				<tr>
					<td id="row-label">
						<xsl:value-of select="$LABEL"/>
					</td>
					<td class="image">
						<img src="../images/{$IMG}" border="1"/>
					</td>
					<td>
						<xsl:apply-templates select="titlePart"/>
					</td>
				</tr>
			</xsl:when>

			<!-- OTHER TITLE WITHOUT IMAGE-->
			<xsl:otherwise>
				<tr>
					<td id="row-label">
						<xsl:value-of select="$LABEL"/>
					</td>
					<td>
						<xsl:apply-templates select="titlePart"/>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

</xsl:stylesheet>

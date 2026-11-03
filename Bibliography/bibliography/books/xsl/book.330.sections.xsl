<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="sections">
		<xsl:variable name="rowCount" select="count(section) + 1"/>
		<tr>
			<td id="row-label" rowspan="{$rowCount}">Contents: </td>
			<td>
				<span id="bold">Signature (Page) Reference</span>
			</td>
			<td>
				<span id="bold">Contents</span>
			</td>
			<td>
				<span id="bold">Signature (Page) Reference</span>
			</td>
			<td>
				<span id="bold">Running Titles</span>
			</td>
		</tr>
		<xsl:apply-templates select="section"/>
	</xsl:template>

	<xsl:template match="section">

		<!--
			When we have exceptional running titles, exceptions are noted with isOn=true.
			I want the exceptions to appear in the same table row as the normal RT.
			I do this by not printing top and bottom borders to the <td>.
			There are three css styles:
				top means no bottom border;
				middle means no top or bottom border;
				bottom means no top border.
			The variable $class calculates which is necessary. The variable is passed to the templates for content or RT.
		-->

		<xsl:variable name="class">
			<xsl:choose>
				<xsl:when
					test="not(RT/@isOn = 'true') and following-sibling::*[1]/RT/@isOn = 'true'"
					>top</xsl:when>
				<xsl:when test="RT/@isOn = 'true' and following-sibling::*[1]/RT/@isOn = 'true'"
					>middle</xsl:when>
				<xsl:when
					test="RT/@isOn = 'true' and not(following-sibling::*[1]/RT/@isOn = 'true')"
					>bottom</xsl:when>
				<xsl:otherwise>default</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<tr id="continue">
			<xsl:choose>
				<xsl:when test="content">
					<xsl:apply-templates select="content">
						<xsl:with-param name="class" select="$class"/>
					</xsl:apply-templates>
				</xsl:when>
				<xsl:otherwise>
					<td class="{$class}"/>
					<td class="{$class}"/>
				</xsl:otherwise>
			</xsl:choose>

			<xsl:choose>
				<xsl:when test="RT">
					<xsl:apply-templates select="RT">
						<xsl:with-param name="class" select="$class"/>
					</xsl:apply-templates>
				</xsl:when>
				<xsl:otherwise>
					<td class="{$class}"/>
					<td class="{$class}"/>
				</xsl:otherwise>
			</xsl:choose>
		</tr>
	</xsl:template>

	<xsl:template match="content | RT">
		<xsl:param name="class"/>

		<td class="{$class}">
			<xsl:if test="@isOn = 'true'">
				<xsl:text>on </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="sigFrom"/>
			<xsl:apply-templates select="sigTo"/>
			<xsl:apply-templates select="pageFrom"/>
			<xsl:apply-templates select="addedRange"/>
		</td>

		<td class="{$class}">
			<xsl:choose>
				<xsl:when test="contentPart">
					<xsl:apply-templates select="contentPart"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="RTPart"/>
				</xsl:otherwise>
			</xsl:choose>
		</td>
	</xsl:template>

	<xsl:template match="addedRange">
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="sigFrom"/>
		<xsl:apply-templates select="sigTo"/>
		<xsl:apply-templates select="pageFrom"/>
	</xsl:template>

	<xsl:template match="sigFrom">
		<xsl:apply-templates select="dupSeqSig"/>
		<xsl:value-of select="multSig"/>
		<xsl:apply-templates select="sigRef"/>
	</xsl:template>

	<xsl:template match="sigTo">
		<xsl:text>&#x2013;</xsl:text> <!--  en dash unicode U+2013 -->
		<xsl:value-of select="multSig"/>
		<xsl:apply-templates select="sigRef"/>
	</xsl:template>

	<xsl:template match="sigRef">

		<xsl:choose>

			<xsl:when test="contains(., '.')">

				<!-- A numeric signature where signature and page are separated
					with a period. Example: '1.2r'. Parse out the signature ('1'), 
					page ('2r'), leaf ('2'), and side ('r').
					Print signature, leaf (in subscript), side.
				-->

				<xsl:variable name="PAGE">
					<xsl:value-of select="substring-after(., '.')"/>
				</xsl:variable>

				<xsl:variable name="LEAF">
					<xsl:choose>
						<xsl:when test="contains($PAGE, 'r')">
							<xsl:value-of select="substring-before($PAGE, 'r')"/>
						</xsl:when>
						<xsl:when test="contains($PAGE, 'v')">
							<xsl:value-of select="substring-before($PAGE, 'v')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$PAGE"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:variable name="SIDE">
					<xsl:choose>
						<xsl:when test="contains($PAGE, 'r')">
							<xsl:value-of select="'r'"/>
						</xsl:when>
						<xsl:when test="contains($PAGE, 'v')">
							<xsl:value-of select="'v'"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="''"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:value-of select="substring-before(., '.')"/>
				<span id="sub">
					<xsl:value-of select="$LEAF"/>
				</span>
				<xsl:value-of select="$SIDE"/>
			</xsl:when>

			<xsl:otherwise>
				<xsl:value-of select="."/>
			</xsl:otherwise>

		</xsl:choose>
	</xsl:template>

	<xsl:template match="pageFrom">
		<xsl:text> (</xsl:text>
		<xsl:apply-templates select="dupSeqPage"/>
		<xsl:value-of select="pageRef"/>
		<xsl:apply-templates select="../pageTo"/>
		<xsl:text>)</xsl:text>
	</xsl:template>

	<xsl:template match="pageTo">
		<xsl:text>&#x2013;</xsl:text>  <!--  en dash unicode U+2013 -->
		<!-- The if test handles the rare situation where the page range is  -->
		<!-- 1 through ^chi 10. See Whist.1.2.xml.  -->
		<xsl:if test="not(../pageFrom/dupSeqPage)">
			<xsl:apply-templates select="dupSeqPage"/>
		</xsl:if>
		<xsl:value-of select="pageRef"/>
	</xsl:template>

</xsl:stylesheet>
